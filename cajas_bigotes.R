sc_indv <- c(65, 90, 35, 85, 45, 90, 85, 90, 90, 85, 95, 75, 70, 35, 85)
sc_par <- c(90, 95, 70, 90, 70, 90, 90, 95, 90, 90, 95, 90, 90, 90, 95)

cq_indv <- c(32, 31, 10, 18, 14, 30, 34, 32, 34, 30, 31, 24, 24, 15, 29)
cq_par <- c(33, 32, 24, 32, 24, 33, 32, 34, 32, 33, 33, 33, 32, 33, 34)

#boxplot(sc_indv, sc_par, col=rgb(0, 0.5, 1), alpha = 0.5)
#boxplot(cq_indv, cq_par, col=rgb(0, 0.5, 0), alpha = 0.5)


sc_data <- data.frame("Individual"= sc_indv, "Par"=sc_par)
cq_data <- data.frame("Individual"=cq_indv, "Par"=cq_par)


mypath=file.path("~", "r-studio", "plots", "calificaciones_caja.png")
png(file=mypath, width=600, height=500)
boxplot(sc_data
        , main="Gráfico de califaciones por estrategia"
        , xlab="Estrategia"
        , ylab="Calificación"
        , boxwex=.4
        , col=rgb(24/255, 82/255, 157/255)
        )
dev.off()

mypath=file.path("~", "r-studio", "plots", "calidad_caja.png")
png(file=mypath, width=600, height=500)
boxplot(cq_data
        , main="Gráfico de calidad del código por estrategia"
        , xlab="Estrategia"
        , ylab="Puntaje de calidad"
        , boxwex=.4
        , col=rgb(40/255, 173/255, 86/255)
        )
dev.off()

median(sc_indv)
median(sc_par)

median(cq_indv)
median(cq_par)

wilcox.test(sc_data$Individual, sc_data$Par, paired=TRUE, alternative = "two.sided")
wilcox.test(cq_data$Individual, cq_data$Par, paired=TRUE, alternative = "two.sided")