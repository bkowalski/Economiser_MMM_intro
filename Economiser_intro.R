#### Ładowanie pakietów ####
library(ggplot2)
library(tidyr)

#### Tworzenie danych ####

economiser.data.df <- data.frame(
    date = c("2017-01-02", "2017-01-09", "2017-01-16",
             "2017-01-23", "2017-01-30", "2017-02-06",
             "2017-02-13", "2017-02-20", "2017-02-27",
             "2017-03-06", "2017-03-13", "2017-03-20", "2017-03-27",
             "2017-04-03", "2017-04-10", "2017-04-17",
             "2017-04-24", "2017-05-01", "2017-05-08", "2017-05-15",
             "2017-05-22", "2017-05-29", "2017-06-05",
             "2017-06-12", "2017-06-19", "2017-06-26", "2017-07-03",
             "2017-07-10", "2017-07-17", "2017-07-24",
             "2017-07-31", "2017-08-07", "2017-08-14", "2017-08-21",
             "2017-08-28", "2017-09-04", "2017-09-11",
             "2017-09-18", "2017-09-25", "2017-10-02", "2017-10-09",
             "2017-10-16", "2017-10-23", "2017-10-30",
             "2017-11-06", "2017-11-13", "2017-11-20", "2017-11-27",
             "2017-12-04", "2017-12-11", "2017-12-18",
             "2017-12-25", "2018-01-01", "2018-01-08", "2018-01-15",
             "2018-01-22", "2018-01-29", "2018-02-05",
             "2018-02-12", "2018-02-19", "2018-02-26", "2018-03-05",
             "2018-03-12", "2018-03-19", "2018-03-26",
             "2018-04-02", "2018-04-09", "2018-04-16", "2018-04-23",
             "2018-04-30", "2018-05-07", "2018-05-14",
             "2018-05-21", "2018-05-28", "2018-06-04", "2018-06-11",
             "2018-06-18", "2018-06-25", "2018-07-02",
             "2018-07-09", "2018-07-16", "2018-07-23", "2018-07-30",
             "2018-08-06", "2018-08-13", "2018-08-20",
             "2018-08-27", "2018-09-03", "2018-09-10", "2018-09-17",
             "2018-09-24", "2018-10-01", "2018-10-08",
             "2018-10-15", "2018-10-22", "2018-10-29", "2018-11-05",
             "2018-11-12", "2018-11-19", "2018-11-26",
             "2018-12-03", "2018-12-10", "2018-12-17", "2018-12-24"),
    sales = c(2.67138958201457, 4.29970914600827,
              26.2150703965567, 14.8807897048017,
              18.4757297453732, 9.61887327705795, 12.2512426606978,
              28.1921562077067, 25.3174548066088, 20.492019357986,
              31.8102055989363, 34.6772410520438,
              20.9205924917775, 9.951671591132, 16.0606852925569,
              11.9392047355479, 15.3416392892986, 12.9663844754314,
              31.7340971874866, 24.0169705593316, 30.5102909952559,
              31.7550666307636, 11.7475909322273,
              20.2860601303124, 24.4655408789834, 19.5065861833594,
              7.62233598740719, 6.89018609320278, 9.74265043500411,
              6.54448024441437, 15.012407875473, 10.206429672835,
              12.8588916827291, 8.15054119216457,
              5.86261586862407, 20.1052590692834, 14.2896871062263,
              25.4539922624693, 14.4501726149562, 27.220262020455,
              28.792427158327, 32.0640494804991, 24.2595583564096,
              29.4348523027498, 23.5929936305578,
              30.5805363137602, 21.3353034488563, 26.6214852665035,
              24.8516804122698, 17.2902570339835, 11.7051326484127,
              8.71068215694859, 21.3601798744243, 18.4461872726625,
              9.16882279540208, -0.39276454173403,
              17.4812456419447, 19.7385290528097, 22.4421095787671,
              19.5378557045912, 36.5375013384285, 26.1735137889706,
              34.4893699299541, 30.1439708631815,
              8.51276339061392, 15.9149698574329, 17.1609288995038,
              13.5433388651773, 16.7023570292794, 11.3197542835797,
              30.6465279560233, 29.8187961555023, 29.2788833624029,
              27.3251940453669, 24.5661751960717,
              27.3003309750476, 24.2736006051595, 32.8313057654005,
              30.5404479891439, 22.0735355078914, 28.0475638472076,
              14.2771759967614, 17.0417667572011,
              10.7337708592888, 20.561846353364, 16.2348760135636,
              24.067637309054, 15.3950120636714, 11.283226147916,
              12.2556215974134, 12.1721422857011, 18.0216224416139,
              17.3106913683408, 21.5033924517377, 31.7641382649806,
              24.7081255735165, 43.7654073075056,
              25.266358119985, 37.981823335542, 34.0708902523791,
              25.3316603209013, 28.9268743707159, 30.2240586933281,
              32.8531627303452),
    price.own = c(3, 3, 3, 1.3, 1.3, 1.3, 3, 3, 3, 3, 3, 3, 3, 3,
                  3, 3, 3, 3, 3, 3, 3, 3, 1.2, 1.2, 1.2, 1.2, 3,
                  3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2.1, 2.1, 2.1,
                  2.1, 2.1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
                  3, 3, 3, 3, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4,
                  1.4, 3, 3, 3, 2.15, 2.15, 2.15, 2.15, 2.15, 2.15, 3,
                  3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2.25,
                  2.25, 2.25, 2.25, 2.25, 3, 3, 3, 3, 3, 3, 3),
    price.compet.1 = c(4.52742397348187, 3.85045426000843,
                       4.72783501295734, 4.44093890750691,
                       5.05847544455105, 3.48983656978538, 4.65936905832469,
                       4.66391082907431, 4.0563060687197, 3.99359741673145,
                       3.5503285236285, 3.88454700878919,
                       4.00217445769036, 3.83772605281866, 4.20660934837675,
                       4.05060949415566, 4.69213675718448, 4.05210374215534,
                       3.83243953352373, 4.33373006161395, 4.7941666830036,
                       3.90446377456861, 3.74814116471646,
                       4.42391820078941, 4.20723645416761, 4.78745169111511,
                       3.77990683813703, 3.80841786638864, 4.63045168555155,
                       4.56357816619619, 3.64838296147269, 4.90676827283048,
                       3.95806974608836, 4.04853685524521,
                       4.53047515959994, 4.1847393378315, 3.79222829974071,
                       4.19623897084922, 4.94286549197438, 4.10891470357651,
                       3.8295080408668, 4.23821420525575, 4.98271305584704,
                       4.13104274176044, 4.02901590069299,
                       4.87648776302094, 3.29649062971668, 4.20453093168241,
                       4.30517986373009, 3.95327067150689, 4.11587764158687,
                       4.07346141395406, 4.0819048364594, 3.5599948026343,
                       4.11141851345241, 4.96958864415828,
                       3.7392940174076, 4.07731991305075, 3.55312583383385,
                       4.67220174182535, 4.75403710268822, 4.5731117123236,
                       4.46013256850728, 3.57204097479075, 4.40471396112594,
                       4.31662751939153, 4.91217017601975,
                       4.53512341604956, 4.12351281414747, 4.12852563722836,
                       4.13758874596942, 4.2604903369955, 4.19465327168402,
                       4.23136677135057, 4.23111296447007, 4.04481309565328,
                       4.22049876946302, 4.52058005397378,
                       3.80701256075897, 3.88439675647229, 4.5677244919211,
                       4.38967009882673, 3.77332077139409, 4.22510497130839,
                       4.01147207143406, 4.50689729043894,
                       3.82040633287168, 4.21815582975427, 4.31469716547122,
                       4.38867652374876, 5.01507806906965, 3.83118387097385,
                       4.49319189577908, 4.46712787986402, 5.35948451514509,
                       4.21361897669538, 3.34116976197357,
                       3.67417818210365, 3.78498739942886, 4.04343874429397,
                       4.16136998131649, 4.14369403248526, 5.05678075057131,
                       4.00699654591438),
    price.compet.2 = c(2.08749187025228, 1.45719025073164,
                       2.9067207838296, 3.51282806911446,
                       0.683174095024767, 1.71983597008253, 0.775895776756984,
                       1.58204709158181, 1.72704451542342, 2.55471487988904,
                       2.74843052459563, 2.94675164130446,
                       1.87118857999303, 1.43026046601952, 1.99302035667207,
                       2.22330808039294, 2.63511545831634, 0.85155146037046,
                       3.35931057923997, 2.51077043349154,
                       2.36614899664299, 3.39204339337768, 1.46591701628754,
                       2.15681192342675, 3.37555692907617, 2.14847069289016,
                       1.64576847571103, 2.13902210038325, 1.63165560459872,
                       1.39451768611138, 0.642911124086067,
                       1.49473862486936, 1.70754198538193, 3.3006043186581,
                       3.02262740912326, 2.6815553549452, 1.87520729048789,
                       2.53971086314938, 1.99636641940179, 2.70879221349802,
                       2.03255569029795, 1.74068052442305,
                       1.67437345457037, 2.03222925919207, 2.31476062406631,
                       3.38928969345075, 1.58532641690854, 1.42914191607114,
                       2.07967946510342, 2.71960395300386,
                       1.49415587094709, 1.33316251237951, 2.06927018752361,
                       2.1749202546692, 0.224288287000229, 1.42167833111837,
                       2.79977347428709, 2.84218346420253, 2.75297373472764,
                       2.57741223780328, 1.91853316381408,
                       0.616042526707832, 1.56148872580753, 1.65191195434264,
                       1.3196663797018, 1.89503548599231, 1.94005698697395,
                       1.32230352919588, 3.54063075976584, 2.91471161225915,
                       1.72638878402424, 1.83682393190084,
                       2.38927928058832, 1.74002086105444, 2.19744209271241,
                       1.14897275731931, 1.76431639960639, 2.02612480744477,
                       2.3285393290312, 2.53191972329506,
                       4.38955628032498, 0.916533445498376, 1.27915669616465,
                       1.13151946650594, 1.84125245902443, 1.00441008588198,
                       2.10735762997075, 0.708716886175969, 1.17485636477841,
                       2.06865466229154, 0.376375762267643,
                       2.27209622973328, 1.37704587858371, 2.79964794085372,
                       3.68658177562482, 1.68406438085975, 2.95720495608832,
                       0.394302184380877, 2.30049468443807,
                       0.766341142844837, 2.073792096115, 1.85939802795208,
                       0.954533038607182, 2.2241479107368),
    distribution.numeric.own = c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                 0.45, 0.45, 0.45, 1, 1, 1, 1, 1, 1, 0.39, 0.39,
                                 0.39, 0.39, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                 1, 1, 1, 1, 1, 0.52, 0.52, 0.52, 0.52, 0.52, 1,
                                 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                 0.36, 0.36, 0.36, 0.36, 0.36, 0.36, 0.36, 0.36, 1,
                                 1, 1, 1, 1, 1, 1, 0.64, 0.64, 0.64, 0.64, 0.64,
                                 0.64, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.42, 0.42,
                                 0.42, 1),
    distribution.compet.1 = c(80.1238596272003, 81.9857854466779,
                              76.2470366695871, 76.7623452586966,
                              80.1497036500343, 87.7264082342152, 82.2176540075191,
                              74.238146739422, 78.7205989841747, 78.8605776706589,
                              84.678930395924, 74.8270268049533,
                              75.8694013952786, 84.9907207789053, 81.1675633353049,
                              85.3643099192685, 72.8347443958804, 81.7122158060385,
                              73.8685752827021, 77.8637484132837, 83.7774339671026,
                              66.5675404265526, 77.2759585146148,
                              79.1152571001255, 77.2301368366377, 76.606306807202,
                              75.4091688011551, 79.3769845492447, 85.2026087143999,
                              79.4946965875724, 77.7625082182257, 78.1497735960119,
                              78.798130539217, 84.7518324382725,
                              80.1699898182167, 77.9631161844136, 82.5082948290162,
                              77.6911956427795, 69.0110275065163, 84.3291561056857,
                              81.468267571739, 78.9328570225416, 74.299956836487,
                              89.4527626564532, 85.4517636155435,
                              83.1353216511066, 85.419778825363, 81.8519413830495,
                              85.9935010185975, 83.1823790239498, 79.6109693429738,
                              72.6297197182702, 69.0164075571747, 81.3825540026009,
                              73.1633167481423, 74.697335789177,
                              84.5166241307182, 79.2584265290648, 73.8122323209591,
                              84.43864751963, 77.3723482678985, 83.9827121805438,
                              81.2511839164442, 76.6638325645259, 79.9752407093715,
                              80.9996020659474, 77.670105223976,
                              89.672943594824, 79.6358945893866, 84.2936329148155,
                              79.3338359966545, 81.7618919576599, 74.4910980749002,
                              80.2273520936957, 86.4415333311165, 82.4505180573408,
                              80.8830636784468, 80.2180790424499,
                              82.2536618482048, 73.4333710014925, 81.7530043947812,
                              74.3244955957853, 82.2258941982728, 82.8370278793086,
                              81.2652029854436, 88.8663467706089, 83.5831276424621,
                              74.5680513820189, 83.872802534177,
                              83.7722091674785, 71.112411805365, 74.4050810461534,
                              70.8927193136407, 83.1979528872311, 76.2752516670529,
                              84.3386808928166, 76.2468231674418, 84.9955365795354,
                              81.3001805145424, 81.418352521353,
                              83.5750219095218, 79.5594643334625, 75.7525857457926,
                              85.9307247535935),
    distribution.compet.2 = c(78.5750848405503, 72.5765117347582,
                              42.8458013781296, 55.0472460569587,
                              79.9893444471825, 87.5806280670661, 58.2519247956227,
                              64.579737863936, 79.0074503198502, 75.8883421126858,
                              58.7452433611119, 54.2384913204573,
                              63.5599317735573, 59.5286159882493, 59.4204020881444,
                              65.6930502801137, 66.9107989328676, 56.3764527240327,
                              54.5921096139816, 75.8011943956925, 63.9148743297669,
                              66.8751954359678, 76.7837934253342,
                              83.3920943379177, 65.8682076338762, 69.1195702188964,
                              72.0417461870704, 69.2256183818904, 49.6378724091004,
                              86.0656577445486, 77.1332091700216,
                              65.9339744236565, 68.9023792681054, 81.645098030181,
                              89.5926869993646, 67.5054782742169, 64.2157103187435,
                              39.5684303164228, 74.635149295288, 54.8671355009012,
                              91.141348817599, 71.2605940820434, 49.0204186977849,
                              65.0819076294847, 69.8671448734812,
                              42.0623110500218, 62.5799144974352, 69.7240453223094,
                              72.9985580119202, 58.0492296493993, 70.6779337712079,
                              88.4305769806641, 60.958675477585,
                              56.4044821516452, 64.4966638175439, 110.561547802785,
                              52.705442266707, 54.9070004972362, 69.8947973314522,
                              77.3628164031971, 64.9993666268273, 68.1569665174214,
                              78.7388745775412, 58.865647038458,
                              90.6789437513693, 66.9766032495288, 62.6540764885307,
                              80.7885004251372, 49.3673912543933, 58.8007450302502,
                              55.5417562653412, 75.9241579962568, 47.3550931492899,
                              62.971727308724, 80.208086139997,
                              49.7988254890658, 72.5620474854148, 49.4282181794056,
                              72.3976465285387, 73.4900740885014, 63.7907024963031,
                              58.4095204588614, 52.3350807633219, 67.7680750767608,
                              55.1880266271703, 61.3801593659241,
                              39.1070862217945, 54.6515046328364, 63.293537638272,
                              80.4643804251427, 80.1286800704066, 57.4549066931165,
                              60.3881154617156, 41.5645894068161, 83.5593245749678,
                              76.4975195447549, 51.9853374997977,
                              71.1420874379169, 55.3273070269686, 75.082193910105,
                              67.3475900030951, 62.7732675086265, 71.5040549325713,
                              87.022243826201),
    media.own = c(0L, 0L, 0L, 0L, 0L, 0L, 0L, 120L, 120L, 120L,
                  120L, 120L, 0L, 0L, 0L, 0L, 0L, 0L, 150L, 150L,
                  150L, 150L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
                  0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 115L, 115L, 115L,
                  115L, 115L, 100L, 100L, 100L, 100L, 100L, 0L,
                  0L, 0L, 0L, 0L, 0L, 0L, 0L, 80L, 80L, 80L, 80L,
                  80L, 80L, 80L, 0L, 0L, 0L, 0L, 0L, 0L, 120L, 120L,
                  120L, 120L, 120L, 120L, 120L, 120L, 120L, 120L,
                  120L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
                  0L, 0L, 170L, 170L, 170L, 170L, 170L, 170L, 170L,
                  170L, 170L, 170L)
)

economiser.data.df$date <- as.Date(economiser.data.df$date)


#### Modelowanie ####
str(economiser.data.df)

formula.1 <- sales ~
    log(price.own) +
    distribution.numeric.own +
    log(price.compet.1) +
    log(price.compet.2) +
    distribution.compet.1 +
    distribution.compet.2 +
    media.own

model.1 <- lm(formula.1, data = economiser.data.df)
summary(model.1)

# Ćwiczenie 1: Oszacuj lepszy model MMM od poprzedniego
formula.2 <- sales ~
    _ _ _
    
model.2 <- lm(formula.2, data = economiser.data.df)
summary(model.2)


#### Dekompozycja sprzedaży na podstawie modelu ####

View(model.2$model)
X <- cbind.data.frame(1, model.2$model[, -1])
View(X)
colnames(X)[1] <- '(Intercept)'
coeffs <- model.2$coefficients
coeffs

decomp.df <- coeffs * t(X)
decomp.df <- t(decomp.df)
decomp.df <- cbind.data.frame(economiser.data.df$date, decomp.df)
colnames(decomp.df)[1] <- 'date'
View(decomp.df)

# Ćwiczenie 2: Korzystając z dwóch poniższych obiektów dokonaj sprawdzenia
# czy dokonaliśmy faktycznej dekompozycji sprzedaży, tzn. czy wpływ wszystkich czynników
# sumuje się do sprzedaży dopasowanej przez model
sum.of.factors <- rowSums(decomp.df[, -1])
fitted <- model.2$fitted.values
_ _ _

# Ustawianie poziomów referencyjnych
ggplot(X, aes(x = decomp.df$date, y = `log(price.own)`)) +
    geom_line()
ggplot(decomp.df, aes(x = date, y = `log(price.own)`)) +
    geom_line()

ref.lev <- rep(0, 7)
names(ref.lev) <- colnames(X)
ref.lev

# Ćwiczenie 3: Ustal poziomy referencyjne dla poszczególnych czynników
# umożliwiające sensowną interpretację biznesową wpływu na sprzedaż
ref.lev['log(price.own)'] <- _ _ _(decomp.df$`log(price.own)`)
ref.lev['distribution.numeric.own'] <- _ _ _(decomp.df$`distribution.numeric.own`)
ref.lev['log(price.compet.2)'] <- _ _ _(decomp.df$`log(price.compet.2)`_ _ _)
ref.lev['distribution.compet.1'] <- _ _ _(decomp.df$distribution.compet.1)
ref.lev['distribution.compet.2'] <- _ _ _(decomp.df$distribution.compet.2)
ref.lev['media.own'] <- _ _ _
ref.lev['(Intercept)'] <- -sum(ref.lev[2:7])
ref.lev

decomp.debased.df <- t(decomp.df[, -1]) - ref.lev
decomp.debased.df <- cbind.data.frame(decomp.df$date, t(decomp.debased.df))
colnames(decomp.debased.df)[1] <- 'date'

# sprawdzenie
sum.of.factors <- rowSums(decomp.debased.df[, -1])
all.equal(sum.of.factors, model.2$fitted.values)


#### Tworzenie wykresu dekompozycji/kontrybucji ####

#zamiana danych na formę długą
decomp.long.df <- decomp.debased.df %>%
    gather(key = 'variable', value = 'value', -date)

# dostosowanie kolejności serii
decomp.long.df$variable <- as.factor(decomp.long.df$variable)
decomp.long.df$variable <- factor(decomp.long.df$variable,levels(decomp.long.df$variable)[c(2:7, 1)])

ggplot(decomp.long.df, aes(x = date, y = value, fill = variable)) +
    geom_bar(stat = 'identity')
