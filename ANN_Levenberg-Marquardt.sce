
// Chargement des données
loadmatfile('EEG_data.mat');


// Labelisation 
b1=Abnormal;
b2 = ones(100,1);
Abnormal = [b1 b2];

b1=Normal;
b2 = zeros(100,1);
Normal = [b1 b2];


// Matrice d'entrainement: Train
b1 = Normal(1:50 , :);
b2 = Abnormal(1:50 , :);
Train= [b1;b2];

// Matrice de test: Test
b1 = Normal(50:100 , :);
b2 = Abnormal(50:100 , :);
Test= [b1;b2];


// Extraction des 8 features 
exec('feature_extraction.sce');
[TrainANN] = Feature_extraction(Train);
[TestANN] = Feature_extraction(Test);



// Split les features et les labels
Train =  TrainANN(:,1:8)';T = TrainANN(:,9)';//plot_2group(Train,T);
Train =  TrainANN(:,7)';
Test = TestANN(:,7)';

// Construction du modele de Levenberg–Marquardt et fixation des poids
clear W;
tic();
W = ann_FFBP_lm(Train,T,[1 30 1])
toc()

// Estimation du modele et accuracy d'apprentissage
y = ann_FFBP_run(Train,W);
disp(" L'accuracy de l'apprentissage est de ");
sum(T == round(y))

// Predictions et accuracy des predictions
y1 = ann_FFBP_run(Test,W);
disp(" L'accuracy des predictions est de ");
sum(T == round(y1))

