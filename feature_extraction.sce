
// Fonction pour l'extraction des mes 8 caractéristiques principales

function [TrainANN] = Feature_extraction(Train)

// Moyenne et variance

      TrainANN = zeros(100,9)
     for i=1:100
         signal=Train(i,1:4096);
         
           F1 = mean(signal);
           F2 = variance(signal);


// Asymétrie
            N = size(signal,2);
            m3 = sum((signal-mean(signal))^3)/(N-1)
            F3 = m3/stdev(signal)^3;
// Aplatissement
            m4 = sum((signal-mean(signal))^4)/(N-1)
            F4 = m4/stdev(signal)^4;

// Median 
            F5 = median(signal); 

// Coeff de variation du signal
            F6 = sqrt(F2)/F1;

// Ecart-type
             F7 = stdev(signal);

// Passages a zéro
              F8 = length(find(signal==0));

            TrainANN(i,:)= [F1,F2,F3, F4 ,F5 ,F6, F7, F8,Train(i,4097) ];
         end
     
   
 

endfunction
