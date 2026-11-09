// Subdivisions+Data.swift
// GeoKit
//
// ISO 3166-2 first-level subdivisions for the countries GeoKit currently has full lists for.
// Contributions adding more countries are welcome — see Country+AddressData.swift for how a
// country's `subdivisionLabel` and `subdivisions` are wired together.

nonisolated extension Country {
    nonisolated static let isoSubdivisions: [Country: [Subdivision]] = [
        .us: usStates,
        .ca: caProvinces,
        .au: auStates,
        .mx: mxStates,
        .br: brStates,
        .it: itRegions,
        .es: esCommunities,
        .jp: jpPrefectures,
        .cn: cnDivisions,
        .`in`: inStates
    ]

    nonisolated private static let usStates: [Subdivision] = [
        Subdivision(code: "US-AL", name: "Alabama"), Subdivision(code: "US-AK", name: "Alaska"),
        Subdivision(code: "US-AZ", name: "Arizona"), Subdivision(code: "US-AR", name: "Arkansas"),
        Subdivision(code: "US-CA", name: "California"), Subdivision(code: "US-CO", name: "Colorado"),
        Subdivision(code: "US-CT", name: "Connecticut"), Subdivision(code: "US-DE", name: "Delaware"),
        Subdivision(code: "US-DC", name: "District of Columbia"), Subdivision(code: "US-FL", name: "Florida"),
        Subdivision(code: "US-GA", name: "Georgia"), Subdivision(code: "US-HI", name: "Hawaii"),
        Subdivision(code: "US-ID", name: "Idaho"), Subdivision(code: "US-IL", name: "Illinois"),
        Subdivision(code: "US-IN", name: "Indiana"), Subdivision(code: "US-IA", name: "Iowa"),
        Subdivision(code: "US-KS", name: "Kansas"), Subdivision(code: "US-KY", name: "Kentucky"),
        Subdivision(code: "US-LA", name: "Louisiana"), Subdivision(code: "US-ME", name: "Maine"),
        Subdivision(code: "US-MD", name: "Maryland"), Subdivision(code: "US-MA", name: "Massachusetts"),
        Subdivision(code: "US-MI", name: "Michigan"), Subdivision(code: "US-MN", name: "Minnesota"),
        Subdivision(code: "US-MS", name: "Mississippi"), Subdivision(code: "US-MO", name: "Missouri"),
        Subdivision(code: "US-MT", name: "Montana"), Subdivision(code: "US-NE", name: "Nebraska"),
        Subdivision(code: "US-NV", name: "Nevada"), Subdivision(code: "US-NH", name: "New Hampshire"),
        Subdivision(code: "US-NJ", name: "New Jersey"), Subdivision(code: "US-NM", name: "New Mexico"),
        Subdivision(code: "US-NY", name: "New York"), Subdivision(code: "US-NC", name: "North Carolina"),
        Subdivision(code: "US-ND", name: "North Dakota"), Subdivision(code: "US-OH", name: "Ohio"),
        Subdivision(code: "US-OK", name: "Oklahoma"), Subdivision(code: "US-OR", name: "Oregon"),
        Subdivision(code: "US-PA", name: "Pennsylvania"), Subdivision(code: "US-RI", name: "Rhode Island"),
        Subdivision(code: "US-SC", name: "South Carolina"), Subdivision(code: "US-SD", name: "South Dakota"),
        Subdivision(code: "US-TN", name: "Tennessee"), Subdivision(code: "US-TX", name: "Texas"),
        Subdivision(code: "US-UT", name: "Utah"), Subdivision(code: "US-VT", name: "Vermont"),
        Subdivision(code: "US-VA", name: "Virginia"), Subdivision(code: "US-WA", name: "Washington"),
        Subdivision(code: "US-WV", name: "West Virginia"), Subdivision(code: "US-WI", name: "Wisconsin"),
        Subdivision(code: "US-WY", name: "Wyoming")
    ]

    nonisolated private static let caProvinces: [Subdivision] = [
        Subdivision(code: "CA-AB", name: "Alberta"), Subdivision(code: "CA-BC", name: "British Columbia"),
        Subdivision(code: "CA-MB", name: "Manitoba"), Subdivision(code: "CA-NB", name: "New Brunswick"),
        Subdivision(code: "CA-NL", name: "Newfoundland and Labrador"), Subdivision(code: "CA-NS", name: "Nova Scotia"),
        Subdivision(code: "CA-ON", name: "Ontario"), Subdivision(code: "CA-PE", name: "Prince Edward Island"),
        Subdivision(code: "CA-QC", name: "Quebec"), Subdivision(code: "CA-SK", name: "Saskatchewan"),
        Subdivision(code: "CA-NT", name: "Northwest Territories"), Subdivision(code: "CA-NU", name: "Nunavut"),
        Subdivision(code: "CA-YT", name: "Yukon")
    ]

    nonisolated private static let auStates: [Subdivision] = [
        Subdivision(code: "AU-NSW", name: "New South Wales"), Subdivision(code: "AU-QLD", name: "Queensland"),
        Subdivision(code: "AU-SA", name: "South Australia"), Subdivision(code: "AU-TAS", name: "Tasmania"),
        Subdivision(code: "AU-VIC", name: "Victoria"), Subdivision(code: "AU-WA", name: "Western Australia"),
        Subdivision(code: "AU-ACT", name: "Australian Capital Territory"),
        Subdivision(code: "AU-NT", name: "Northern Territory")
    ]

    nonisolated private static let mxStates: [Subdivision] = [
        Subdivision(code: "MX-AGU", name: "Aguascalientes"), Subdivision(code: "MX-BCN", name: "Baja California"),
        Subdivision(code: "MX-BCS", name: "Baja California Sur"), Subdivision(code: "MX-CAM", name: "Campeche"),
        Subdivision(code: "MX-CHP", name: "Chiapas"), Subdivision(code: "MX-CHH", name: "Chihuahua"),
        Subdivision(code: "MX-COA", name: "Coahuila"), Subdivision(code: "MX-COL", name: "Colima"),
        Subdivision(code: "MX-CMX", name: "Ciudad de México"), Subdivision(code: "MX-DUR", name: "Durango"),
        Subdivision(code: "MX-GUA", name: "Guanajuato"), Subdivision(code: "MX-GRO", name: "Guerrero"),
        Subdivision(code: "MX-HID", name: "Hidalgo"), Subdivision(code: "MX-JAL", name: "Jalisco"),
        Subdivision(code: "MX-MEX", name: "México"), Subdivision(code: "MX-MIC", name: "Michoacán"),
        Subdivision(code: "MX-MOR", name: "Morelos"), Subdivision(code: "MX-NAY", name: "Nayarit"),
        Subdivision(code: "MX-NLE", name: "Nuevo León"), Subdivision(code: "MX-OAX", name: "Oaxaca"),
        Subdivision(code: "MX-PUE", name: "Puebla"), Subdivision(code: "MX-QUE", name: "Querétaro"),
        Subdivision(code: "MX-ROO", name: "Quintana Roo"), Subdivision(code: "MX-SLP", name: "San Luis Potosí"),
        Subdivision(code: "MX-SIN", name: "Sinaloa"), Subdivision(code: "MX-SON", name: "Sonora"),
        Subdivision(code: "MX-TAB", name: "Tabasco"), Subdivision(code: "MX-TAM", name: "Tamaulipas"),
        Subdivision(code: "MX-TLA", name: "Tlaxcala"), Subdivision(code: "MX-VER", name: "Veracruz"),
        Subdivision(code: "MX-YUC", name: "Yucatán"), Subdivision(code: "MX-ZAC", name: "Zacatecas")
    ]

    nonisolated private static let brStates: [Subdivision] = [
        Subdivision(code: "BR-AC", name: "Acre"), Subdivision(code: "BR-AL", name: "Alagoas"),
        Subdivision(code: "BR-AP", name: "Amapá"), Subdivision(code: "BR-AM", name: "Amazonas"),
        Subdivision(code: "BR-BA", name: "Bahia"), Subdivision(code: "BR-CE", name: "Ceará"),
        Subdivision(code: "BR-DF", name: "Distrito Federal"), Subdivision(code: "BR-ES", name: "Espírito Santo"),
        Subdivision(code: "BR-GO", name: "Goiás"), Subdivision(code: "BR-MA", name: "Maranhão"),
        Subdivision(code: "BR-MT", name: "Mato Grosso"), Subdivision(code: "BR-MS", name: "Mato Grosso do Sul"),
        Subdivision(code: "BR-MG", name: "Minas Gerais"), Subdivision(code: "BR-PA", name: "Pará"),
        Subdivision(code: "BR-PB", name: "Paraíba"), Subdivision(code: "BR-PR", name: "Paraná"),
        Subdivision(code: "BR-PE", name: "Pernambuco"), Subdivision(code: "BR-PI", name: "Piauí"),
        Subdivision(code: "BR-RJ", name: "Rio de Janeiro"), Subdivision(code: "BR-RN", name: "Rio Grande do Norte"),
        Subdivision(code: "BR-RS", name: "Rio Grande do Sul"), Subdivision(code: "BR-RO", name: "Rondônia"),
        Subdivision(code: "BR-RR", name: "Roraima"), Subdivision(code: "BR-SC", name: "Santa Catarina"),
        Subdivision(code: "BR-SP", name: "São Paulo"), Subdivision(code: "BR-SE", name: "Sergipe"),
        Subdivision(code: "BR-TO", name: "Tocantins")
    ]

    nonisolated private static let itRegions: [Subdivision] = [
        Subdivision(code: "IT-65", name: "Abruzzo"), Subdivision(code: "IT-77", name: "Basilicata"),
        Subdivision(code: "IT-78", name: "Calabria"), Subdivision(code: "IT-72", name: "Campania"),
        Subdivision(code: "IT-45", name: "Emilia-Romagna"), Subdivision(code: "IT-36", name: "Friuli-Venezia Giulia"),
        Subdivision(code: "IT-62", name: "Lazio"), Subdivision(code: "IT-42", name: "Liguria"),
        Subdivision(code: "IT-25", name: "Lombardia"), Subdivision(code: "IT-57", name: "Marche"),
        Subdivision(code: "IT-67", name: "Molise"), Subdivision(code: "IT-21", name: "Piemonte"),
        Subdivision(code: "IT-75", name: "Puglia"), Subdivision(code: "IT-88", name: "Sardegna"),
        Subdivision(code: "IT-82", name: "Sicilia"), Subdivision(code: "IT-52", name: "Toscana"),
        Subdivision(code: "IT-32", name: "Trentino-Alto Adige"), Subdivision(code: "IT-55", name: "Umbria"),
        Subdivision(code: "IT-23", name: "Valle d'Aosta"), Subdivision(code: "IT-34", name: "Veneto")
    ]

    nonisolated private static let esCommunities: [Subdivision] = [
        Subdivision(code: "ES-AN", name: "Andalucía"), Subdivision(code: "ES-AR", name: "Aragón"),
        Subdivision(code: "ES-AS", name: "Asturias"), Subdivision(code: "ES-CN", name: "Canarias"),
        Subdivision(code: "ES-CB", name: "Cantabria"), Subdivision(code: "ES-CM", name: "Castilla-La Mancha"),
        Subdivision(code: "ES-CL", name: "Castilla y León"), Subdivision(code: "ES-CT", name: "Cataluña"),
        Subdivision(code: "ES-EX", name: "Extremadura"), Subdivision(code: "ES-GA", name: "Galicia"),
        Subdivision(code: "ES-IB", name: "Illes Balears"), Subdivision(code: "ES-RI", name: "La Rioja"),
        Subdivision(code: "ES-MD", name: "Madrid"), Subdivision(code: "ES-MC", name: "Murcia"),
        Subdivision(code: "ES-NC", name: "Navarra"), Subdivision(code: "ES-PV", name: "País Vasco"),
        Subdivision(code: "ES-VC", name: "Comunidad Valenciana"), Subdivision(code: "ES-CE", name: "Ceuta"),
        Subdivision(code: "ES-ML", name: "Melilla")
    ]

    nonisolated private static let jpPrefectures: [Subdivision] = [
        Subdivision(code: "JP-01", name: "Hokkaido"), Subdivision(code: "JP-02", name: "Aomori"),
        Subdivision(code: "JP-03", name: "Iwate"), Subdivision(code: "JP-04", name: "Miyagi"),
        Subdivision(code: "JP-05", name: "Akita"), Subdivision(code: "JP-06", name: "Yamagata"),
        Subdivision(code: "JP-07", name: "Fukushima"), Subdivision(code: "JP-08", name: "Ibaraki"),
        Subdivision(code: "JP-09", name: "Tochigi"), Subdivision(code: "JP-10", name: "Gunma"),
        Subdivision(code: "JP-11", name: "Saitama"), Subdivision(code: "JP-12", name: "Chiba"),
        Subdivision(code: "JP-13", name: "Tokyo"), Subdivision(code: "JP-14", name: "Kanagawa"),
        Subdivision(code: "JP-15", name: "Niigata"), Subdivision(code: "JP-16", name: "Toyama"),
        Subdivision(code: "JP-17", name: "Ishikawa"), Subdivision(code: "JP-18", name: "Fukui"),
        Subdivision(code: "JP-19", name: "Yamanashi"), Subdivision(code: "JP-20", name: "Nagano"),
        Subdivision(code: "JP-21", name: "Gifu"), Subdivision(code: "JP-22", name: "Shizuoka"),
        Subdivision(code: "JP-23", name: "Aichi"), Subdivision(code: "JP-24", name: "Mie"),
        Subdivision(code: "JP-25", name: "Shiga"), Subdivision(code: "JP-26", name: "Kyoto"),
        Subdivision(code: "JP-27", name: "Osaka"), Subdivision(code: "JP-28", name: "Hyogo"),
        Subdivision(code: "JP-29", name: "Nara"), Subdivision(code: "JP-30", name: "Wakayama"),
        Subdivision(code: "JP-31", name: "Tottori"), Subdivision(code: "JP-32", name: "Shimane"),
        Subdivision(code: "JP-33", name: "Okayama"), Subdivision(code: "JP-34", name: "Hiroshima"),
        Subdivision(code: "JP-35", name: "Yamaguchi"), Subdivision(code: "JP-36", name: "Tokushima"),
        Subdivision(code: "JP-37", name: "Kagawa"), Subdivision(code: "JP-38", name: "Ehime"),
        Subdivision(code: "JP-39", name: "Kochi"), Subdivision(code: "JP-40", name: "Fukuoka"),
        Subdivision(code: "JP-41", name: "Saga"), Subdivision(code: "JP-42", name: "Nagasaki"),
        Subdivision(code: "JP-43", name: "Kumamoto"), Subdivision(code: "JP-44", name: "Oita"),
        Subdivision(code: "JP-45", name: "Miyazaki"), Subdivision(code: "JP-46", name: "Kagoshima"),
        Subdivision(code: "JP-47", name: "Okinawa")
    ]

    nonisolated private static let cnDivisions: [Subdivision] = [
        Subdivision(code: "CN-AH", name: "Anhui"), Subdivision(code: "CN-FJ", name: "Fujian"),
        Subdivision(code: "CN-GS", name: "Gansu"), Subdivision(code: "CN-GD", name: "Guangdong"),
        Subdivision(code: "CN-GZ", name: "Guizhou"), Subdivision(code: "CN-HI", name: "Hainan"),
        Subdivision(code: "CN-HE", name: "Hebei"), Subdivision(code: "CN-HL", name: "Heilongjiang"),
        Subdivision(code: "CN-HA", name: "Henan"), Subdivision(code: "CN-HB", name: "Hubei"),
        Subdivision(code: "CN-HN", name: "Hunan"), Subdivision(code: "CN-JS", name: "Jiangsu"),
        Subdivision(code: "CN-JX", name: "Jiangxi"), Subdivision(code: "CN-JL", name: "Jilin"),
        Subdivision(code: "CN-LN", name: "Liaoning"), Subdivision(code: "CN-QH", name: "Qinghai"),
        Subdivision(code: "CN-SN", name: "Shaanxi"), Subdivision(code: "CN-SD", name: "Shandong"),
        Subdivision(code: "CN-SX", name: "Shanxi"), Subdivision(code: "CN-SC", name: "Sichuan"),
        Subdivision(code: "CN-YN", name: "Yunnan"), Subdivision(code: "CN-ZJ", name: "Zhejiang"),
        Subdivision(code: "CN-BJ", name: "Beijing"), Subdivision(code: "CN-TJ", name: "Tianjin"),
        Subdivision(code: "CN-SH", name: "Shanghai"), Subdivision(code: "CN-CQ", name: "Chongqing"),
        Subdivision(code: "CN-NM", name: "Nei Mongol"), Subdivision(code: "CN-GX", name: "Guangxi"),
        Subdivision(code: "CN-XZ", name: "Xizang"), Subdivision(code: "CN-NX", name: "Ningxia"),
        Subdivision(code: "CN-XJ", name: "Xinjiang")
    ]

    nonisolated private static let inStates: [Subdivision] = [
        Subdivision(code: "IN-AP", name: "Andhra Pradesh"), Subdivision(code: "IN-AR", name: "Arunachal Pradesh"),
        Subdivision(code: "IN-AS", name: "Assam"), Subdivision(code: "IN-BR", name: "Bihar"),
        Subdivision(code: "IN-CT", name: "Chhattisgarh"), Subdivision(code: "IN-GA", name: "Goa"),
        Subdivision(code: "IN-GJ", name: "Gujarat"), Subdivision(code: "IN-HR", name: "Haryana"),
        Subdivision(code: "IN-HP", name: "Himachal Pradesh"), Subdivision(code: "IN-JH", name: "Jharkhand"),
        Subdivision(code: "IN-KA", name: "Karnataka"), Subdivision(code: "IN-KL", name: "Kerala"),
        Subdivision(code: "IN-MP", name: "Madhya Pradesh"), Subdivision(code: "IN-MH", name: "Maharashtra"),
        Subdivision(code: "IN-MN", name: "Manipur"), Subdivision(code: "IN-ML", name: "Meghalaya"),
        Subdivision(code: "IN-MZ", name: "Mizoram"), Subdivision(code: "IN-NL", name: "Nagaland"),
        Subdivision(code: "IN-OR", name: "Odisha"), Subdivision(code: "IN-PB", name: "Punjab"),
        Subdivision(code: "IN-RJ", name: "Rajasthan"), Subdivision(code: "IN-SK", name: "Sikkim"),
        Subdivision(code: "IN-TN", name: "Tamil Nadu"), Subdivision(code: "IN-TG", name: "Telangana"),
        Subdivision(code: "IN-TR", name: "Tripura"), Subdivision(code: "IN-UP", name: "Uttar Pradesh"),
        Subdivision(code: "IN-UK", name: "Uttarakhand"), Subdivision(code: "IN-WB", name: "West Bengal"),
        Subdivision(code: "IN-AN", name: "Andaman and Nicobar Islands"), Subdivision(code: "IN-CH", name: "Chandigarh"),
        Subdivision(code: "IN-DH", name: "Dadra and Nagar Haveli and Daman and Diu"),
        Subdivision(code: "IN-DL", name: "Delhi"), Subdivision(code: "IN-JK", name: "Jammu and Kashmir"),
        Subdivision(code: "IN-LA", name: "Ladakh"), Subdivision(code: "IN-LD", name: "Lakshadweep"),
        Subdivision(code: "IN-PY", name: "Puducherry")
    ]
}
