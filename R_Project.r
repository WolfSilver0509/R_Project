# Importation des données 
data <- read.csv(url("https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.cleveland.data"), header =  FALSE)
# modification du nom des colones
colnames(data)<- c("age", "sex","cp","trestdps","chol","fbs","restecg","thalach","exang","oldpeak","slope","ca","thal","target")
# modification de la collone target , traitement ( 1 ou 0) il y a des 2 , 3  et 4.
data$target[data$target==2]<- 1
data$target[data$target==3]<- 1
data$target[data$target==4]<- 1
# supression des valeurs manquantes 
#data <- data[-1,]
valeur_manquante_ca <- which(data$ca%in%"?")
valeur_manquante_thal <- which(data$thal%in%"?")
valeurs_manquantes <- c(valeur_manquante_ca,valeur_manquante_thal)
data <- data[-valeurs_manquantes,]


# vérification du type des variables
str(data)
# modification du type des variables

##Variable qualitative ( factor =  variable qualitative)
data$sex<- as.factor(data$sex)
data$cp<- as.factor(data$cp)
data$fbs<- as.factor(data$fbs)
data$restecg<- as.factor(data$restecg)
data$exang<- as.factor(data$exang)
data$slope<- as.factor(data$slope)
data$ca<- as.factor(data$ca)
data$thal<- as.factor(data$thal)
data$target<- as.factor(data$target)

##Variable quantitative ( integer =  variable qualitative)
data$age<-as.integer(data$age)
data$trestdps<-as.integer(data$trestdps)
data$chol<-as.integer(data$chol)
data$thalach<-as.integer(data$thalach)

# recodage des variables
levels(data$sex)<-c("Femme", "Homme")
levels(data$cp)<-c("Angine de poitrine stable", "Angine instable","Douleur non angineuse","asympatomatique")
levels(data$fbs)<-c("glycémie supp à 120 ", "glycémie inferireur à 120 ")
levels(data$restecg)<-c("Normal", "Anomalie","hypertrophie")
levels(data$exang)<-c("Non", "oui")
levels(data$slope)<-c("En hausse", "Stable","En baisse")
levels(data$ca)<-c("Abscence d'anomalie ca", "faible","moyen","élevé")
levels(data$thal)<-c("Abscence d'anomalie", "HThalassémie sous controle"," thalassémie instable")
levels(data$target)<-c("Non", "Oui")

# vérification du type des variables
str(data)

# derniére verification valeur manquantes aprés traitements
apply(data, 2, anyNA)
