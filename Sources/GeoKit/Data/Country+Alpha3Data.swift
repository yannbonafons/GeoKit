// Country+Alpha3Data.swift
// GeoKit
//
// ISO 3166-1 alpha-3 and numeric codes for every `Country` case.

public nonisolated extension Country {
    /// The ISO 3166-1 alpha-3 code, e.g. `"FRA"`.
    nonisolated var alpha3: String {
        Country.alpha3AndNumeric[self]?.0 ?? ""
    }

    /// The ISO 3166-1 numeric code, e.g. `"250"`.
    ///
    /// `.xk` (Kosovo) has no officially assigned numeric code and returns `"000"`.
    nonisolated var numericCode: String {
        Country.alpha3AndNumeric[self]?.1 ?? "000"
    }

    nonisolated private static let alpha3AndNumeric: [Country: (String, String)] = [
        .ad: ("AND", "020"), .ae: ("ARE", "784"), .af: ("AFG", "004"), .ag: ("ATG", "028"),
        .ai: ("AIA", "660"), .al: ("ALB", "008"), .am: ("ARM", "051"), .ao: ("AGO", "024"),
        .aq: ("ATA", "010"), .ar: ("ARG", "032"), .as: ("ASM", "016"), .at: ("AUT", "040"),
        .au: ("AUS", "036"), .aw: ("ABW", "533"), .ax: ("ALA", "248"), .az: ("AZE", "031"),
        .ba: ("BIH", "070"), .bb: ("BRB", "052"), .bd: ("BGD", "050"), .be: ("BEL", "056"),
        .bf: ("BFA", "854"), .bg: ("BGR", "100"), .bh: ("BHR", "048"), .bi: ("BDI", "108"),
        .bj: ("BEN", "204"), .bl: ("BLM", "652"), .bm: ("BMU", "060"), .bn: ("BRN", "096"),
        .bo: ("BOL", "068"), .bq: ("BES", "535"), .br: ("BRA", "076"), .bs: ("BHS", "044"),
        .bt: ("BTN", "064"), .bv: ("BVT", "074"), .bw: ("BWA", "072"), .by: ("BLR", "112"),
        .bz: ("BLZ", "084"), .ca: ("CAN", "124"), .cc: ("CCK", "166"), .cd: ("COD", "180"),
        .cf: ("CAF", "140"), .cg: ("COG", "178"), .ch: ("CHE", "756"), .ci: ("CIV", "384"),
        .ck: ("COK", "184"), .cl: ("CHL", "152"), .cm: ("CMR", "120"), .cn: ("CHN", "156"),
        .co: ("COL", "170"), .cr: ("CRI", "188"), .cu: ("CUB", "192"), .cv: ("CPV", "132"),
        .cw: ("CUW", "531"), .cx: ("CXR", "162"), .cy: ("CYP", "196"), .cz: ("CZE", "203"),
        .de: ("DEU", "276"), .dj: ("DJI", "262"), .dk: ("DNK", "208"), .dm: ("DMA", "212"),
        .`do`: ("DOM", "214"), .dz: ("DZA", "012"), .ec: ("ECU", "218"), .ee: ("EST", "233"),
        .eg: ("EGY", "818"), .eh: ("ESH", "732"), .er: ("ERI", "232"), .es: ("ESP", "724"),
        .et: ("ETH", "231"), .fi: ("FIN", "246"), .fj: ("FJI", "242"), .fk: ("FLK", "238"),
        .fm: ("FSM", "583"), .fo: ("FRO", "234"), .fr: ("FRA", "250"), .ga: ("GAB", "266"),
        .gb: ("GBR", "826"), .gd: ("GRD", "308"), .ge: ("GEO", "268"), .gf: ("GUF", "254"),
        .gg: ("GGY", "831"), .gh: ("GHA", "288"), .gi: ("GIB", "292"), .gl: ("GRL", "304"),
        .gm: ("GMB", "270"), .gn: ("GIN", "324"), .gp: ("GLP", "312"), .gq: ("GNQ", "226"),
        .gr: ("GRC", "300"), .gs: ("SGS", "239"), .gt: ("GTM", "320"), .gu: ("GUM", "316"),
        .gw: ("GNB", "624"), .gy: ("GUY", "328"), .hk: ("HKG", "344"), .hm: ("HMD", "334"),
        .hn: ("HND", "340"), .hr: ("HRV", "191"), .ht: ("HTI", "332"), .hu: ("HUN", "348"),
        .id: ("IDN", "360"), .ie: ("IRL", "372"), .il: ("ISR", "376"), .im: ("IMN", "833"),
        .`in`: ("IND", "356"), .io: ("IOT", "086"), .iq: ("IRQ", "368"), .ir: ("IRN", "364"),
        .is: ("ISL", "352"), .it: ("ITA", "380"), .je: ("JEY", "832"), .jm: ("JAM", "388"),
        .jo: ("JOR", "400"), .jp: ("JPN", "392"), .ke: ("KEN", "404"), .kg: ("KGZ", "417"),
        .kh: ("KHM", "116"), .ki: ("KIR", "296"), .km: ("COM", "174"), .kn: ("KNA", "659"),
        .kp: ("PRK", "408"), .kr: ("KOR", "410"), .kw: ("KWT", "414"), .ky: ("CYM", "136"),
        .kz: ("KAZ", "398"), .la: ("LAO", "418"), .lb: ("LBN", "422"), .lc: ("LCA", "662"),
        .li: ("LIE", "438"), .lk: ("LKA", "144"), .lr: ("LBR", "430"), .ls: ("LSO", "426"),
        .lt: ("LTU", "440"), .lu: ("LUX", "442"), .lv: ("LVA", "428"), .ly: ("LBY", "434"),
        .ma: ("MAR", "504"), .mc: ("MCO", "492"), .md: ("MDA", "498"), .me: ("MNE", "499"),
        .mf: ("MAF", "663"), .mg: ("MDG", "450"), .mh: ("MHL", "584"), .mk: ("MKD", "807"),
        .ml: ("MLI", "466"), .mm: ("MMR", "104"), .mn: ("MNG", "496"), .mo: ("MAC", "446"),
        .mp: ("MNP", "580"), .mq: ("MTQ", "474"), .mr: ("MRT", "478"), .ms: ("MSR", "500"),
        .mt: ("MLT", "470"), .mu: ("MUS", "480"), .mv: ("MDV", "462"), .mw: ("MWI", "454"),
        .mx: ("MEX", "484"), .my: ("MYS", "458"), .mz: ("MOZ", "508"), .na: ("NAM", "516"),
        .nc: ("NCL", "540"), .ne: ("NER", "562"), .nf: ("NFK", "574"), .ng: ("NGA", "566"),
        .ni: ("NIC", "558"), .nl: ("NLD", "528"), .no: ("NOR", "578"), .np: ("NPL", "524"),
        .nr: ("NRU", "520"), .nu: ("NIU", "570"), .nz: ("NZL", "554"), .om: ("OMN", "512"),
        .pa: ("PAN", "591"), .pe: ("PER", "604"), .pf: ("PYF", "258"), .pg: ("PNG", "598"),
        .ph: ("PHL", "608"), .pk: ("PAK", "586"), .pl: ("POL", "616"), .pm: ("SPM", "666"),
        .pn: ("PCN", "612"), .pr: ("PRI", "630"), .ps: ("PSE", "275"), .pt: ("PRT", "620"),
        .pw: ("PLW", "585"), .py: ("PRY", "600"), .qa: ("QAT", "634"), .re: ("REU", "638"),
        .ro: ("ROU", "642"), .rs: ("SRB", "688"), .ru: ("RUS", "643"), .rw: ("RWA", "646"),
        .sa: ("SAU", "682"), .sb: ("SLB", "090"), .sc: ("SYC", "690"), .sd: ("SDN", "729"),
        .se: ("SWE", "752"), .sg: ("SGP", "702"), .sh: ("SHN", "654"), .si: ("SVN", "705"),
        .sj: ("SJM", "744"), .sk: ("SVK", "703"), .sl: ("SLE", "694"), .sm: ("SMR", "674"),
        .sn: ("SEN", "686"), .so: ("SOM", "706"), .sr: ("SUR", "740"), .ss: ("SSD", "728"),
        .st: ("STP", "678"), .sv: ("SLV", "222"), .sx: ("SXM", "534"), .sy: ("SYR", "760"),
        .sz: ("SWZ", "748"), .tc: ("TCA", "796"), .td: ("TCD", "148"), .tf: ("ATF", "260"),
        .tg: ("TGO", "768"), .th: ("THA", "764"), .tj: ("TJK", "762"), .tk: ("TKL", "772"),
        .tl: ("TLS", "626"), .tm: ("TKM", "795"), .tn: ("TUN", "788"), .to: ("TON", "776"),
        .tr: ("TUR", "792"), .tt: ("TTO", "780"), .tv: ("TUV", "798"), .tw: ("TWN", "158"),
        .tz: ("TZA", "834"), .ua: ("UKR", "804"), .ug: ("UGA", "800"), .um: ("UMI", "581"),
        .us: ("USA", "840"), .uy: ("URY", "858"), .uz: ("UZB", "860"), .va: ("VAT", "336"),
        .vc: ("VCT", "670"), .ve: ("VEN", "862"), .vg: ("VGB", "092"), .vi: ("VIR", "850"),
        .vn: ("VNM", "704"), .vu: ("VUT", "548"), .wf: ("WLF", "876"), .ws: ("WSM", "882"),
        .xk: ("XKX", "000"), .ye: ("YEM", "887"), .yt: ("MYT", "175"), .za: ("ZAF", "710"),
        .zm: ("ZMB", "894"), .zw: ("ZWE", "716")
    ]
}
