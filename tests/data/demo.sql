DROP DATABASE demo;
CREATE DATABASE demo;


\connect demo


CREATE TABLE airports_data (
    airport_code character(3) NOT NULL,
    airport_name jsonb NOT NULL,
    city jsonb NOT NULL,
    coordinates point NOT NULL,
    timezone text NOT NULL
);


CREATE TABLE flights (
    flight_id integer NOT NULL,
    flight_no character(6) NOT NULL,
    scheduled_departure timestamp with time zone NOT NULL,
    scheduled_arrival timestamp with time zone NOT NULL,
    departure_airport character(3) NOT NULL,
    arrival_airport character(3) NOT NULL,
    status character varying(20) NOT NULL,
    aircraft_code character(3) NOT NULL,
    actual_departure timestamp with time zone,
    actual_arrival timestamp with time zone,
    CONSTRAINT flights_check CHECK ((scheduled_arrival > scheduled_departure)),
    CONSTRAINT flights_check1 CHECK (((actual_arrival IS NULL) OR ((actual_departure IS NOT NULL) AND (actual_arrival IS NOT NULL) AND (actual_arrival > actual_departure)))),
    CONSTRAINT flights_status_check CHECK (((status)::text = ANY (ARRAY[('On Time'::character varying)::text, ('Delayed'::character varying)::text, ('Departed'::character varying)::text, ('Arrived'::character varying)::text, ('Scheduled'::character varying)::text, ('Cancelled'::character varying)::text])))
);


COPY airports_data (airport_code, airport_name, city, coordinates, timezone) FROM stdin;
YKS	{"en": "Yakutsk Airport", "ru": "Якутск"}	{"en": "Yakutsk", "ru": "Якутск"}	(129.77099609375,62.0932998657226562)	Asia/Yakutsk
MJZ	{"en": "Mirny Airport", "ru": "Мирный"}	{"en": "Mirnyj", "ru": "Мирный"}	(114.03900146484375,62.534698486328125)	Asia/Yakutsk
KHV	{"en": "Khabarovsk-Novy Airport", "ru": "Хабаровск-Новый"}	{"en": "Khabarovsk", "ru": "Хабаровск"}	(135.18800354004,48.5279998779300001)	Asia/Vladivostok
PKC	{"en": "Yelizovo Airport", "ru": "Елизово"}	{"en": "Petropavlovsk", "ru": "Петропавловск-Камчатский"}	(158.453994750976562,53.1679000854492188)	Asia/Kamchatka
UUS	{"en": "Yuzhno-Sakhalinsk Airport", "ru": "Хомутово"}	{"en": "Yuzhno-Sakhalinsk", "ru": "Южно-Сахалинск"}	(142.718002319335938,46.8886985778808594)	Asia/Sakhalin
VVO	{"en": "Vladivostok International Airport", "ru": "Владивосток"}	{"en": "Vladivostok", "ru": "Владивосток"}	(132.147994995117188,43.3989982604980469)	Asia/Vladivostok
LED	{"en": "Pulkovo Airport", "ru": "Пулково"}	{"en": "St. Petersburg", "ru": "Санкт-Петербург"}	(30.2625007629394531,59.8003005981445312)	Europe/Moscow
KGD	{"en": "Khrabrovo Airport", "ru": "Храброво"}	{"en": "Kaliningrad", "ru": "Калининград"}	(20.5925998687744141,54.8899993896484375)	Europe/Kaliningrad
KEJ	{"en": "Kemerovo Airport", "ru": "Кемерово"}	{"en": "Kemorovo", "ru": "Кемерово"}	(86.1072006225585938,55.2700996398925781)	Asia/Novokuznetsk
CEK	{"en": "Chelyabinsk Balandino Airport", "ru": "Челябинск"}	{"en": "Chelyabinsk", "ru": "Челябинск"}	(61.503300000000003,55.3058010000000024)	Asia/Yekaterinburg
MQF	{"en": "Magnitogorsk International Airport", "ru": "Магнитогорск"}	{"en": "Magnetiogorsk", "ru": "Магнитогорск"}	(58.7556991577148438,53.3931007385253906)	Asia/Yekaterinburg
PEE	{"en": "Bolshoye Savino Airport", "ru": "Пермь"}	{"en": "Perm", "ru": "Пермь"}	(56.021198272705,57.9145011901860016)	Asia/Yekaterinburg
SGC	{"en": "Surgut Airport", "ru": "Сургут"}	{"en": "Surgut", "ru": "Сургут"}	(73.4018020629882812,61.3437004089355469)	Asia/Yekaterinburg
BZK	{"en": "Bryansk Airport", "ru": "Брянск"}	{"en": "Bryansk", "ru": "Брянск"}	(34.1763992309999978,53.2141990661999955)	Europe/Moscow
MRV	{"en": "Mineralnyye Vody Airport", "ru": "Минеральные Воды"}	{"en": "Mineralnye Vody", "ru": "Минеральные Воды"}	(43.0819015502929688,44.2251014709472656)	Europe/Moscow
STW	{"en": "Stavropol Shpakovskoye Airport", "ru": "Ставрополь"}	{"en": "Stavropol", "ru": "Ставрополь"}	(42.1128005981445312,45.1091995239257812)	Europe/Moscow
ASF	{"en": "Astrakhan Airport", "ru": "Астрахань"}	{"en": "Astrakhan", "ru": "Астрахань"}	(48.0063018799000005,46.2832984924000002)	Europe/Samara
NJC	{"en": "Nizhnevartovsk Airport", "ru": "Нижневартовск"}	{"en": "Nizhnevartovsk", "ru": "Нижневартовск"}	(76.4835968017578125,60.9492988586425781)	Asia/Yekaterinburg
SVX	{"en": "Koltsovo Airport", "ru": "Кольцово"}	{"en": "Yekaterinburg", "ru": "Екатеринбург"}	(60.8027000427250002,56.7430992126460012)	Asia/Yekaterinburg
SVO	{"en": "Sheremetyevo International Airport", "ru": "Шереметьево"}	{"en": "Moscow", "ru": "Москва"}	(37.4146000000000001,55.9725990000000024)	Europe/Moscow
VOZ	{"en": "Voronezh International Airport", "ru": "Воронеж"}	{"en": "Voronezh", "ru": "Воронеж"}	(39.2295989990234375,51.8142013549804688)	Europe/Moscow
VKO	{"en": "Vnukovo International Airport", "ru": "Внуково"}	{"en": "Moscow", "ru": "Москва"}	(37.2615013122999983,55.5914993286000012)	Europe/Moscow
SCW	{"en": "Syktyvkar Airport", "ru": "Сыктывкар"}	{"en": "Syktyvkar", "ru": "Сыктывкар"}	(50.8451004028320312,61.6469993591308594)	Europe/Moscow
KUF	{"en": "Kurumoch International Airport", "ru": "Курумоч"}	{"en": "Samara", "ru": "Самара"}	(50.1642990112299998,53.5049018859860013)	Europe/Samara
DME	{"en": "Domodedovo International Airport", "ru": "Домодедово"}	{"en": "Moscow", "ru": "Москва"}	(37.9062995910644531,55.4087982177734375)	Europe/Moscow
TJM	{"en": "Roshchino International Airport", "ru": "Рощино"}	{"en": "Tyumen", "ru": "Тюмень"}	(65.3243026732999965,57.1896018981999958)	Asia/Yekaterinburg
GOJ	{"en": "Nizhny Novgorod Strigino International Airport", "ru": "Стригино"}	{"en": "Nizhniy Novgorod", "ru": "Нижний Новгород"}	(43.7840003967289988,56.2300987243649999)	Europe/Moscow
TOF	{"en": "Bogashevo Airport", "ru": "Богашёво"}	{"en": "Tomsk", "ru": "Томск"}	(85.2082977294920028,56.3802986145020029)	Asia/Krasnoyarsk
UIK	{"en": "Ust-Ilimsk Airport", "ru": "Усть-Илимск"}	{"en": "Ust Ilimsk", "ru": "Усть-Илимск"}	(102.56500244140625,58.1361007690429688)	Asia/Irkutsk
NSK	{"en": "Norilsk-Alykel Airport", "ru": "Норильск"}	{"en": "Norilsk", "ru": "Норильск"}	(87.3321990966796875,69.31109619140625)	Asia/Krasnoyarsk
ARH	{"en": "Talagi Airport", "ru": "Талаги"}	{"en": "Arkhangelsk", "ru": "Архангельск"}	(40.7167015075683594,64.6003036499023438)	Europe/Moscow
RTW	{"en": "Saratov Central Airport", "ru": "Саратов-Центральный"}	{"en": "Saratov", "ru": "Саратов"}	(46.0466995239257812,51.5649986267089844)	Europe/Volgograd
NUX	{"en": "Novy Urengoy Airport", "ru": "Новый Уренгой"}	{"en": "Novy Urengoy", "ru": "Новый Уренгой"}	(76.5203018188476562,66.06939697265625)	Asia/Yekaterinburg
NOJ	{"en": "Noyabrsk Airport", "ru": "Ноябрьск"}	{"en": "Noyabrsk", "ru": "Ноябрьск"}	(75.2699966430664062,63.1833000183105469)	Asia/Yekaterinburg
UCT	{"en": "Ukhta Airport", "ru": "Ухта"}	{"en": "Ukhta", "ru": "Ухта"}	(53.8046989440917969,63.5668983459472656)	Europe/Moscow
USK	{"en": "Usinsk Airport", "ru": "Усинск"}	{"en": "Usinsk", "ru": "Усинск"}	(57.3671989440917969,66.00469970703125)	Europe/Moscow
NNM	{"en": "Naryan Mar Airport", "ru": "Нарьян-Мар"}	{"en": "Naryan-Mar", "ru": "Нарьян-Мар"}	(53.1218986511230469,67.6399993896484375)	Europe/Moscow
PKV	{"en": "Pskov Airport", "ru": "Псков"}	{"en": "Pskov", "ru": "Псков"}	(28.395599365234375,57.7839012145996094)	Europe/Moscow
KGP	{"en": "Kogalym International Airport", "ru": "Когалым"}	{"en": "Kogalym", "ru": "Когалым"}	(74.5337982177734375,62.190399169921875)	Asia/Yekaterinburg
KJA	{"en": "Yemelyanovo Airport", "ru": "Емельяново"}	{"en": "Krasnoyarsk", "ru": "Красноярск"}	(92.493301391602003,56.1729011535639984)	Asia/Krasnoyarsk
URJ	{"en": "Uray Airport", "ru": "Петрозаводск"}	{"en": "Uraj", "ru": "Урай"}	(64.8266983032226562,60.1032981872558594)	Asia/Yekaterinburg
IWA	{"en": "Ivanovo South Airport", "ru": "Иваново-Южный"}	{"en": "Ivanovo", "ru": "Иваново"}	(40.9407997131347656,56.9393997192382812)	Europe/Moscow
PYJ	{"en": "Polyarny Airport", "ru": "Полярный"}	{"en": "Yakutia", "ru": "Удачный"}	(112.029998778999996,66.4003982544000024)	Asia/Yakutsk
KXK	{"en": "Komsomolsk-on-Amur Airport", "ru": "Хурба"}	{"en": "Komsomolsk-on-Amur", "ru": "Комсомольск-на-Амуре"}	(136.934005737304688,50.4090003967285156)	Asia/Vladivostok
DYR	{"en": "Ugolny Airport", "ru": "Анадырь"}	{"en": "Anadyr", "ru": "Анадырь"}	(177.740997314453125,64.7349014282226562)	Asia/Anadyr
PES	{"en": "Petrozavodsk Airport", "ru": "Бесовец"}	{"en": "Petrozavodsk", "ru": "Петрозаводск"}	(34.1547012329101562,61.8852005004882812)	Europe/Moscow
KYZ	{"en": "Kyzyl Airport", "ru": "Кызыл"}	{"en": "Kyzyl", "ru": "Кызыл"}	(94.4005966186523438,51.6693992614746094)	Asia/Krasnoyarsk
NOZ	{"en": "Spichenkovo Airport", "ru": "Спиченково"}	{"en": "Novokuznetsk", "ru": "Новокузнецк"}	(86.877197265625,53.8114013671875)	Asia/Novokuznetsk
GRV	{"en": "Khankala Air Base", "ru": "Грозный"}	{"en": "Grozny", "ru": "Грозный"}	(45.7840995788574219,43.2980995178222656)	Europe/Moscow
NAL	{"en": "Nalchik Airport", "ru": "Нальчик"}	{"en": "Nalchik", "ru": "Нальчик"}	(43.6366004943847656,43.5129013061523438)	Europe/Moscow
OGZ	{"en": "Beslan Airport", "ru": "Беслан"}	{"en": "Beslan", "ru": "Владикавказ"}	(44.6066017150999983,43.2051010132000002)	Europe/Moscow
ESL	{"en": "Elista Airport", "ru": "Элиста"}	{"en": "Elista", "ru": "Элиста"}	(44.3308982849121094,46.3739013671875)	Europe/Moscow
SLY	{"en": "Salekhard Airport", "ru": "Салехард"}	{"en": "Salekhard", "ru": "Салехард"}	(66.6110000610351562,66.5907974243164062)	Asia/Yekaterinburg
HMA	{"en": "Khanty Mansiysk Airport", "ru": "Ханты-Мансийск"}	{"en": "Khanty-Mansiysk", "ru": "Ханты-Мансийск"}	(69.0860977172851562,61.0284996032714844)	Asia/Yekaterinburg
NYA	{"en": "Nyagan Airport", "ru": "Нягань"}	{"en": "Nyagan", "ru": "Нягань"}	(65.6149978637695312,62.1100006103515625)	Asia/Yekaterinburg
OVS	{"en": "Sovetskiy Airport", "ru": "Советский"}	{"en": "Sovetskiy", "ru": "Советский"}	(63.6019134521484375,61.3266220092773438)	Asia/Yekaterinburg
IJK	{"en": "Izhevsk Airport", "ru": "Ижевск"}	{"en": "Izhevsk", "ru": "Ижевск"}	(53.4575004577636719,56.8280982971191406)	Europe/Samara
KVX	{"en": "Pobedilovo Airport", "ru": "Победилово"}	{"en": "Kirov", "ru": "Киров"}	(49.3483009338379972,58.5032997131350001)	Europe/Moscow
NYM	{"en": "Nadym Airport", "ru": "Надым"}	{"en": "Nadym", "ru": "Надым"}	(72.6988983154296875,65.4809036254882812)	Asia/Yekaterinburg
NFG	{"en": "Nefteyugansk Airport", "ru": "Нефтеюганск"}	{"en": "Nefteyugansk", "ru": "Нефтеюганск"}	(72.6500015258789062,61.1082992553710938)	Asia/Yekaterinburg
KRO	{"en": "Kurgan Airport", "ru": "Курган"}	{"en": "Kurgan", "ru": "Курган"}	(65.4156036376953125,55.4752998352050781)	Asia/Yekaterinburg
EGO	{"en": "Belgorod International Airport", "ru": "Белгород"}	{"en": "Belgorod", "ru": "Белгород"}	(36.5900993347167969,50.643798828125)	Europe/Moscow
URS	{"en": "Kursk East Airport", "ru": "Курск-Восточный"}	{"en": "Kursk", "ru": "Курск"}	(36.2956008911132812,51.7505989074707031)	Europe/Moscow
LPK	{"en": "Lipetsk Airport", "ru": "Липецк"}	{"en": "Lipetsk", "ru": "Липецк"}	(39.5377998352050781,52.7028007507324219)	Europe/Moscow
VKT	{"en": "Vorkuta Airport", "ru": "Воркута"}	{"en": "Vorkuta", "ru": "Воркута"}	(63.9930992126464844,67.4886016845703125)	Europe/Moscow
UUA	{"en": "Bugulma Airport", "ru": "Бугульма"}	{"en": "Bugulma", "ru": "Бугульма"}	(52.8017005920410156,54.6399993896484375)	Europe/Moscow
JOK	{"en": "Yoshkar-Ola Airport", "ru": "Йошкар-Ола"}	{"en": "Yoshkar-Ola", "ru": "Йошкар-Ола"}	(47.9047012329101562,56.7005996704101562)	Europe/Moscow
CSY	{"en": "Cheboksary Airport", "ru": "Чебоксары"}	{"en": "Cheboksary", "ru": "Чебоксары"}	(47.3473014831542969,56.090301513671875)	Europe/Moscow
ULY	{"en": "Ulyanovsk East Airport", "ru": "Ульяновск-Восточный"}	{"en": "Ulyanovsk", "ru": "Ульяновск"}	(48.8027000427246094,54.4010009765625)	Europe/Samara
OSW	{"en": "Orsk Airport", "ru": "Орск"}	{"en": "Orsk", "ru": "Орск"}	(58.5956001281738281,51.0724983215332031)	Asia/Yekaterinburg
PEZ	{"en": "Penza Airport", "ru": "Пенза"}	{"en": "Penza", "ru": "Пенза"}	(45.0210990905761719,53.1105995178222656)	Europe/Moscow
SKX	{"en": "Saransk Airport", "ru": "Саранск"}	{"en": "Saransk", "ru": "Саранск"}	(45.2122573852539062,54.1251296997070312)	Europe/Moscow
TBW	{"en": "Donskoye Airport", "ru": "Донское"}	{"en": "Tambow", "ru": "Тамбов"}	(41.4827995300289984,52.806098937987997)	Europe/Moscow
UKX	{"en": "Ust-Kut Airport", "ru": "Усть-Кут"}	{"en": "Ust-Kut", "ru": "Усть-Кут"}	(105.730003356933594,56.8567008972167969)	Asia/Irkutsk
GDZ	{"en": "Gelendzhik Airport", "ru": "Геленджик"}	{"en": "Gelendzhik", "ru": "Геленджик"}	(38.012480735799997,44.5820926295000035)	Europe/Moscow
IAR	{"en": "Tunoshna Airport", "ru": "Туношна"}	{"en": "Yaroslavl", "ru": "Ярославль"}	(40.1573982238769531,57.560699462890625)	Europe/Moscow
NBC	{"en": "Begishevo Airport", "ru": "Бегишево"}	{"en": "Nizhnekamsk", "ru": "Нижнекамск"}	(52.092498779296875,55.5647010803222656)	Europe/Moscow
ULV	{"en": "Ulyanovsk Baratayevka Airport", "ru": "Баратаевка"}	{"en": "Ulyanovsk", "ru": "Ульяновск"}	(48.2266998291000064,54.2682991027999932)	Europe/Samara
SWT	{"en": "Strezhevoy Airport", "ru": "Стрежевой"}	{"en": "Strezhevoy", "ru": "Стрежевой"}	(77.66000366210001,60.7094001769999991)	Asia/Krasnoyarsk
EYK	{"en": "Beloyarskiy Airport", "ru": "Белоярский"}	{"en": "Beloyarsky", "ru": "Белоярский"}	(66.6986007689999951,63.6869010924999941)	Asia/Yekaterinburg
KLF	{"en": "Grabtsevo Airport", "ru": "Калуга"}	{"en": "Kaluga", "ru": "Калуга"}	(36.3666687011999983,54.5499992371000033)	Europe/Moscow
RGK	{"en": "Gorno-Altaysk Airport", "ru": "Горно-Алтайск"}	{"en": "Gorno-Altaysk", "ru": "Горно-Алтайск"}	(85.8332977295000035,51.9667015075999998)	Asia/Krasnoyarsk
KRR	{"en": "Krasnodar Pashkovsky International Airport", "ru": "Краснодар"}	{"en": "Krasnodar", "ru": "Краснодар"}	(39.1705017089839984,45.0346984863279971)	Europe/Moscow
MCX	{"en": "Uytash Airport", "ru": "Уйташ"}	{"en": "Makhachkala", "ru": "Махачкала"}	(47.6523017883300781,42.8167991638183594)	Europe/Moscow
KZN	{"en": "Kazan International Airport", "ru": "Казань"}	{"en": "Kazan", "ru": "Казань"}	(49.278701782227003,55.606201171875)	Europe/Moscow
REN	{"en": "Orenburg Central Airport", "ru": "Оренбург-Центральный"}	{"en": "Orenburg", "ru": "Оренбург"}	(55.4566993713378906,51.7957992553710938)	Asia/Yekaterinburg
UFA	{"en": "Ufa International Airport", "ru": "Уфа"}	{"en": "Ufa", "ru": "Уфа"}	(55.8744010925289984,54.5574989318850001)	Asia/Yekaterinburg
OVB	{"en": "Tolmachevo Airport", "ru": "Толмачёво"}	{"en": "Novosibirsk", "ru": "Новосибирск"}	(82.6507034301759944,55.012599945067997)	Asia/Novosibirsk
CEE	{"en": "Cherepovets Airport", "ru": "Череповец"}	{"en": "Cherepovets", "ru": "Череповец"}	(38.0158004761000043,59.2736015320000007)	Europe/Moscow
OMS	{"en": "Omsk Central Airport", "ru": "Омск-Центральный"}	{"en": "Omsk", "ru": "Омск"}	(73.3105010986328125,54.9669990539550781)	Asia/Omsk
ROV	{"en": "Rostov-on-Don Airport", "ru": "Ростов-на-Дону"}	{"en": "Rostov", "ru": "Ростов-на-Дону"}	(39.8180999755999991,47.2582015990999977)	Europe/Moscow
AER	{"en": "Sochi International Airport", "ru": "Сочи"}	{"en": "Sochi", "ru": "Сочи"}	(39.9566001892089986,43.4499015808110016)	Europe/Moscow
VOG	{"en": "Volgograd International Airport", "ru": "Гумрак"}	{"en": "Volgograd", "ru": "Волгоград"}	(44.3455009460449219,48.782501220703125)	Europe/Volgograd
BQS	{"en": "Ignatyevo Airport", "ru": "Игнатьево"}	{"en": "Blagoveschensk", "ru": "Благовещенск"}	(127.412002563476562,50.4253997802734375)	Asia/Yakutsk
GDX	{"en": "Sokol Airport", "ru": "Магадан"}	{"en": "Magadan", "ru": "Магадан"}	(150.720001220703125,59.9109992980957031)	Asia/Magadan
HTA	{"en": "Chita-Kadala Airport", "ru": "Чита"}	{"en": "Chita", "ru": "Чита"}	(113.305999999999997,52.0262990000000016)	Asia/Chita
BTK	{"en": "Bratsk Airport", "ru": "Братск"}	{"en": "Bratsk", "ru": "Братск"}	(101.697998046875,56.3706016540527344)	Asia/Irkutsk
IKT	{"en": "Irkutsk Airport", "ru": "Иркутск"}	{"en": "Irkutsk", "ru": "Иркутск"}	(104.388999938959998,52.2680015563960012)	Asia/Irkutsk
UUD	{"en": "Ulan-Ude Airport (Mukhino)", "ru": "Байкал"}	{"en": "Ulan-ude", "ru": "Улан-Удэ"}	(107.438003540039062,51.80780029296875)	Asia/Irkutsk
MMK	{"en": "Murmansk Airport", "ru": "Мурманск"}	{"en": "Murmansk", "ru": "Мурманск"}	(32.7508010864257812,68.7817001342773438)	Europe/Moscow
ABA	{"en": "Abakan Airport", "ru": "Абакан"}	{"en": "Abakan", "ru": "Абакан"}	(91.3850021362304688,53.7400016784667969)	Asia/Krasnoyarsk
BAX	{"en": "Barnaul Airport", "ru": "Барнаул"}	{"en": "Barnaul", "ru": "Барнаул"}	(83.5384979248046875,53.363800048828125)	Asia/Krasnoyarsk
AAQ	{"en": "Anapa Vityazevo Airport", "ru": "Витязево"}	{"en": "Anapa", "ru": "Анапа"}	(37.3473014831539984,45.002101898192997)	Europe/Moscow
CNN	{"en": "Chulman Airport", "ru": "Чульман"}	{"en": "Neryungri", "ru": "Нерюнгри"}	(124.914001464839998,56.9138984680179973)	Asia/Yakutsk
\.


--
-- Name: airports_data airports_data_pkey; Type: CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY airports_data
    ADD CONSTRAINT airports_data_pkey PRIMARY KEY (airport_code);


-- Name: flights flights_flight_no_scheduled_departure_key; Type: CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY flights
    ADD CONSTRAINT flights_flight_no_scheduled_departure_key UNIQUE (flight_no, scheduled_departure);


--
-- Name: flights flights_pkey; Type: CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY flights
    ADD CONSTRAINT flights_pkey PRIMARY KEY (flight_id);

--
-- Name: flights flights_arrival_airport_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY flights
    ADD CONSTRAINT flights_arrival_airport_fkey FOREIGN KEY (arrival_airport) REFERENCES airports_data(airport_code);


--
-- Name: flights flights_departure_airport_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY flights
    ADD CONSTRAINT flights_departure_airport_fkey FOREIGN KEY (departure_airport) REFERENCES airports_data(airport_code);
