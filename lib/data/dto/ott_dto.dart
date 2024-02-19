class Autogenerated {
  int? id;
  Results? results;

  Autogenerated({this.id, this.results});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    results =
    json['results'] != null ? Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (results != null) {
      data['results'] = results!.toJson();
    }
    return data;
  }
}

class Results {
  AD? aD;
  AD? aE;
  AD? aG;
  AD? aL;
  AD? aR;
  AD? aT;
  AD? aU;
  AD? bA;
  AD? bB;
  AD? bE;
  AD? bG;
  AD? bH;
  AD? bM;
  AD? bO;
  AD? bR;
  AD? bS;
  AD? cA;
  AD? cH;
  AD? cL;
  AD? cO;
  AD? cR;
  AD? cZ;
  AD? dE;
  AD? dK;
  AD? dO;
  AD? dZ;
  AD? eC;
  AD? eE;
  AD? eG;
  AD? eS;
  AD? fI;
  AD? fR;
  AD? gB;
  AD? gF;
  AD? gI;
  AD? gR;
  AD? gT;
  AD? hK;
  AD? hN;
  AD? hR;
  AD? hU;
  AD? iD;
  AD? iE;
  AD? iL;
  AD? iN;
  AD? iQ;
  AD? iS;
  AD? iT;
  AD? jM;
  AD? jO;
  AD? jP;
  AD? kR;
  AD? kW;
  AD? lB;
  AD? lC;
  AD? lI;
  AD? lT;
  AD? lV;
  AD? lY;
  AD? mA;
  AD? mC;
  AD? mD;
  AD? mK;
  AD? mT;
  AD? mX;
  AD? mY;
  AD? nI;
  AD? nL;
  AD? nO;
  AD? nZ;
  AD? oM;
  AD? pA;
  AD? pE;
  AD? pF;
  AD? pH;
  AD? pK;
  AD? pL;
  AD? pS;
  AD? pT;
  AD? pY;
  AD? qA;
  AD? rO;
  AD? rS;
  AD? sA;
  AD? sE;
  AD? sG;
  AD? sI;
  AD? sK;
  AD? sM;
  AD? sV;
  AD? tC;
  AD? tH;
  AD? tN;
  AD? tR;
  AD? tT;
  AD? tW;
  AD? uS;
  AD? uY;
  AD? vE;
  AD? yE;
  AD? zA;

  Results(
      {this.aD,
        this.aE,
        this.aG,
        this.aL,
        this.aR,
        this.aT,
        this.aU,
        this.bA,
        this.bB,
        this.bE,
        this.bG,
        this.bH,
        this.bM,
        this.bO,
        this.bR,
        this.bS,
        this.cA,
        this.cH,
        this.cL,
        this.cO,
        this.cR,
        this.cZ,
        this.dE,
        this.dK,
        this.dO,
        this.dZ,
        this.eC,
        this.eE,
        this.eG,
        this.eS,
        this.fI,
        this.fR,
        this.gB,
        this.gF,
        this.gI,
        this.gR,
        this.gT,
        this.hK,
        this.hN,
        this.hR,
        this.hU,
        this.iD,
        this.iE,
        this.iL,
        this.iN,
        this.iQ,
        this.iS,
        this.iT,
        this.jM,
        this.jO,
        this.jP,
        this.kR,
        this.kW,
        this.lB,
        this.lC,
        this.lI,
        this.lT,
        this.lV,
        this.lY,
        this.mA,
        this.mC,
        this.mD,
        this.mK,
        this.mT,
        this.mX,
        this.mY,
        this.nI,
        this.nL,
        this.nO,
        this.nZ,
        this.oM,
        this.pA,
        this.pE,
        this.pF,
        this.pH,
        this.pK,
        this.pL,
        this.pS,
        this.pT,
        this.pY,
        this.qA,
        this.rO,
        this.rS,
        this.sA,
        this.sE,
        this.sG,
        this.sI,
        this.sK,
        this.sM,
        this.sV,
        this.tC,
        this.tH,
        this.tN,
        this.tR,
        this.tT,
        this.tW,
        this.uS,
        this.uY,
        this.vE,
        this.yE,
        this.zA});

  Results.fromJson(Map<String, dynamic> json) {
    aD = json['AD'] != null ? AD.fromJson(json['AD']) : null;
    aE = json['AE'] != null ? AD.fromJson(json['AE']) : null;
    aG = json['AG'] != null ? AD.fromJson(json['AG']) : null;
    aL = json['AL'] != null ? AD.fromJson(json['AL']) : null;
    aR = json['AR'] != null ? AD.fromJson(json['AR']) : null;
    aT = json['AT'] != null ? AD.fromJson(json['AT']) : null;
    aU = json['AU'] != null ? AD.fromJson(json['AU']) : null;
    bA = json['BA'] != null ? AD.fromJson(json['BA']) : null;
    bB = json['BB'] != null ? AD.fromJson(json['BB']) : null;
    bE = json['BE'] != null ? AD.fromJson(json['BE']) : null;
    bG = json['BG'] != null ? AD.fromJson(json['BG']) : null;
    bH = json['BH'] != null ? AD.fromJson(json['BH']) : null;
    bM = json['BM'] != null ? AD.fromJson(json['BM']) : null;
    bO = json['BO'] != null ? AD.fromJson(json['BO']) : null;
    bR = json['BR'] != null ? AD.fromJson(json['BR']) : null;
    bS = json['BS'] != null ? AD.fromJson(json['BS']) : null;
    cA = json['CA'] != null ? AD.fromJson(json['CA']) : null;
    cH = json['CH'] != null ? AD.fromJson(json['CH']) : null;
    cL = json['CL'] != null ? AD.fromJson(json['CL']) : null;
    cO = json['CO'] != null ? AD.fromJson(json['CO']) : null;
    cR = json['CR'] != null ? AD.fromJson(json['CR']) : null;
    cZ = json['CZ'] != null ? AD.fromJson(json['CZ']) : null;
    dE = json['DE'] != null ? AD.fromJson(json['DE']) : null;
    dK = json['DK'] != null ? AD.fromJson(json['DK']) : null;
    dO = json['DO'] != null ? AD.fromJson(json['DO']) : null;
    dZ = json['DZ'] != null ? AD.fromJson(json['DZ']) : null;
    eC = json['EC'] != null ? AD.fromJson(json['EC']) : null;
    eE = json['EE'] != null ? AD.fromJson(json['EE']) : null;
    eG = json['EG'] != null ? AD.fromJson(json['EG']) : null;
    eS = json['ES'] != null ? AD.fromJson(json['ES']) : null;
    fI = json['FI'] != null ? AD.fromJson(json['FI']) : null;
    fR = json['FR'] != null ? AD.fromJson(json['FR']) : null;
    gB = json['GB'] != null ? AD.fromJson(json['GB']) : null;
    gF = json['GF'] != null ? AD.fromJson(json['GF']) : null;
    gI = json['GI'] != null ? AD.fromJson(json['GI']) : null;
    gR = json['GR'] != null ? AD.fromJson(json['GR']) : null;
    gT = json['GT'] != null ? AD.fromJson(json['GT']) : null;
    hK = json['HK'] != null ? AD.fromJson(json['HK']) : null;
    hN = json['HN'] != null ? AD.fromJson(json['HN']) : null;
    hR = json['HR'] != null ? AD.fromJson(json['HR']) : null;
    hU = json['HU'] != null ? AD.fromJson(json['HU']) : null;
    iD = json['ID'] != null ? AD.fromJson(json['ID']) : null;
    iE = json['IE'] != null ? AD.fromJson(json['IE']) : null;
    iL = json['IL'] != null ? AD.fromJson(json['IL']) : null;
    iN = json['IN'] != null ? AD.fromJson(json['IN']) : null;
    iQ = json['IQ'] != null ? AD.fromJson(json['IQ']) : null;
    iS = json['IS'] != null ? AD.fromJson(json['IS']) : null;
    iT = json['IT'] != null ? AD.fromJson(json['IT']) : null;
    jM = json['JM'] != null ? AD.fromJson(json['JM']) : null;
    jO = json['JO'] != null ? AD.fromJson(json['JO']) : null;
    jP = json['JP'] != null ? AD.fromJson(json['JP']) : null;
    kR = json['KR'] != null ? AD.fromJson(json['KR']) : null;
    kW = json['KW'] != null ? AD.fromJson(json['KW']) : null;
    lB = json['LB'] != null ? AD.fromJson(json['LB']) : null;
    lC = json['LC'] != null ? AD.fromJson(json['LC']) : null;
    lI = json['LI'] != null ? AD.fromJson(json['LI']) : null;
    lT = json['LT'] != null ? AD.fromJson(json['LT']) : null;
    lV = json['LV'] != null ? AD.fromJson(json['LV']) : null;
    lY = json['LY'] != null ? AD.fromJson(json['LY']) : null;
    mA = json['MA'] != null ? AD.fromJson(json['MA']) : null;
    mC = json['MC'] != null ? AD.fromJson(json['MC']) : null;
    mD = json['MD'] != null ? AD.fromJson(json['MD']) : null;
    mK = json['MK'] != null ? AD.fromJson(json['MK']) : null;
    mT = json['MT'] != null ? AD.fromJson(json['MT']) : null;
    mX = json['MX'] != null ? AD.fromJson(json['MX']) : null;
    mY = json['MY'] != null ? AD.fromJson(json['MY']) : null;
    nI = json['NI'] != null ? AD.fromJson(json['NI']) : null;
    nL = json['NL'] != null ? AD.fromJson(json['NL']) : null;
    nO = json['NO'] != null ? AD.fromJson(json['NO']) : null;
    nZ = json['NZ'] != null ? AD.fromJson(json['NZ']) : null;
    oM = json['OM'] != null ? AD.fromJson(json['OM']) : null;
    pA = json['PA'] != null ? AD.fromJson(json['PA']) : null;
    pE = json['PE'] != null ? AD.fromJson(json['PE']) : null;
    pF = json['PF'] != null ? AD.fromJson(json['PF']) : null;
    pH = json['PH'] != null ? AD.fromJson(json['PH']) : null;
    pK = json['PK'] != null ? AD.fromJson(json['PK']) : null;
    pL = json['PL'] != null ? AD.fromJson(json['PL']) : null;
    pS = json['PS'] != null ? AD.fromJson(json['PS']) : null;
    pT = json['PT'] != null ? AD.fromJson(json['PT']) : null;
    pY = json['PY'] != null ? AD.fromJson(json['PY']) : null;
    qA = json['QA'] != null ? AD.fromJson(json['QA']) : null;
    rO = json['RO'] != null ? AD.fromJson(json['RO']) : null;
    rS = json['RS'] != null ? AD.fromJson(json['RS']) : null;
    sA = json['SA'] != null ? AD.fromJson(json['SA']) : null;
    sE = json['SE'] != null ? AD.fromJson(json['SE']) : null;
    sG = json['SG'] != null ? AD.fromJson(json['SG']) : null;
    sI = json['SI'] != null ? AD.fromJson(json['SI']) : null;
    sK = json['SK'] != null ? AD.fromJson(json['SK']) : null;
    sM = json['SM'] != null ? AD.fromJson(json['SM']) : null;
    sV = json['SV'] != null ? AD.fromJson(json['SV']) : null;
    tC = json['TC'] != null ? AD.fromJson(json['TC']) : null;
    tH = json['TH'] != null ? AD.fromJson(json['TH']) : null;
    tN = json['TN'] != null ? AD.fromJson(json['TN']) : null;
    tR = json['TR'] != null ? AD.fromJson(json['TR']) : null;
    tT = json['TT'] != null ? AD.fromJson(json['TT']) : null;
    tW = json['TW'] != null ? AD.fromJson(json['TW']) : null;
    uS = json['US'] != null ? AD.fromJson(json['US']) : null;
    uY = json['UY'] != null ? AD.fromJson(json['UY']) : null;
    vE = json['VE'] != null ? AD.fromJson(json['VE']) : null;
    yE = json['YE'] != null ? AD.fromJson(json['YE']) : null;
    zA = json['ZA'] != null ? AD.fromJson(json['ZA']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (aD != null) {
      data['AD'] = aD!.toJson();
    }
    if (aE != null) {
      data['AE'] = aE!.toJson();
    }
    if (aG != null) {
      data['AG'] = aG!.toJson();
    }
    if (aL != null) {
      data['AL'] = aL!.toJson();
    }
    if (aR != null) {
      data['AR'] = aR!.toJson();
    }
    if (aT != null) {
      data['AT'] = aT!.toJson();
    }
    if (aU != null) {
      data['AU'] = aU!.toJson();
    }
    if (bA != null) {
      data['BA'] = bA!.toJson();
    }
    if (bB != null) {
      data['BB'] = bB!.toJson();
    }
    if (bE != null) {
      data['BE'] = bE!.toJson();
    }
    if (bG != null) {
      data['BG'] = bG!.toJson();
    }
    if (bH != null) {
      data['BH'] = bH!.toJson();
    }
    if (bM != null) {
      data['BM'] = bM!.toJson();
    }
    if (bO != null) {
      data['BO'] = bO!.toJson();
    }
    if (bR != null) {
      data['BR'] = bR!.toJson();
    }
    if (bS != null) {
      data['BS'] = bS!.toJson();
    }
    if (cA != null) {
      data['CA'] = cA!.toJson();
    }
    if (cH != null) {
      data['CH'] = cH!.toJson();
    }
    if (cL != null) {
      data['CL'] = cL!.toJson();
    }
    if (cO != null) {
      data['CO'] = cO!.toJson();
    }
    if (cR != null) {
      data['CR'] = cR!.toJson();
    }
    if (cZ != null) {
      data['CZ'] = cZ!.toJson();
    }
    if (dE != null) {
      data['DE'] = dE!.toJson();
    }
    if (dK != null) {
      data['DK'] = dK!.toJson();
    }
    if (dO != null) {
      data['DO'] = dO!.toJson();
    }
    if (dZ != null) {
      data['DZ'] = dZ!.toJson();
    }
    if (eC != null) {
      data['EC'] = eC!.toJson();
    }
    if (eE != null) {
      data['EE'] = eE!.toJson();
    }
    if (eG != null) {
      data['EG'] = eG!.toJson();
    }
    if (eS != null) {
      data['ES'] = eS!.toJson();
    }
    if (fI != null) {
      data['FI'] = fI!.toJson();
    }
    if (fR != null) {
      data['FR'] = fR!.toJson();
    }
    if (gB != null) {
      data['GB'] = gB!.toJson();
    }
    if (gF != null) {
      data['GF'] = gF!.toJson();
    }
    if (gI != null) {
      data['GI'] = gI!.toJson();
    }
    if (gR != null) {
      data['GR'] = gR!.toJson();
    }
    if (gT != null) {
      data['GT'] = gT!.toJson();
    }
    if (hK != null) {
      data['HK'] = hK!.toJson();
    }
    if (hN != null) {
      data['HN'] = hN!.toJson();
    }
    if (hR != null) {
      data['HR'] = hR!.toJson();
    }
    if (hU != null) {
      data['HU'] = hU!.toJson();
    }
    if (iD != null) {
      data['ID'] = iD!.toJson();
    }
    if (iE != null) {
      data['IE'] = iE!.toJson();
    }
    if (iL != null) {
      data['IL'] = iL!.toJson();
    }
    if (iN != null) {
      data['IN'] = iN!.toJson();
    }
    if (iQ != null) {
      data['IQ'] = iQ!.toJson();
    }
    if (iS != null) {
      data['IS'] = iS!.toJson();
    }
    if (iT != null) {
      data['IT'] = iT!.toJson();
    }
    if (jM != null) {
      data['JM'] = jM!.toJson();
    }
    if (jO != null) {
      data['JO'] = jO!.toJson();
    }
    if (jP != null) {
      data['JP'] = jP!.toJson();
    }
    if (kR != null) {
      data['KR'] = kR!.toJson();
    }
    if (kW != null) {
      data['KW'] = kW!.toJson();
    }
    if (lB != null) {
      data['LB'] = lB!.toJson();
    }
    if (lC != null) {
      data['LC'] = lC!.toJson();
    }
    if (lI != null) {
      data['LI'] = lI!.toJson();
    }
    if (lT != null) {
      data['LT'] = lT!.toJson();
    }
    if (lV != null) {
      data['LV'] = lV!.toJson();
    }
    if (lY != null) {
      data['LY'] = lY!.toJson();
    }
    if (mA != null) {
      data['MA'] = mA!.toJson();
    }
    if (mC != null) {
      data['MC'] = mC!.toJson();
    }
    if (mD != null) {
      data['MD'] = mD!.toJson();
    }
    if (mK != null) {
      data['MK'] = mK!.toJson();
    }
    if (mT != null) {
      data['MT'] = mT!.toJson();
    }
    if (mX != null) {
      data['MX'] = mX!.toJson();
    }
    if (mY != null) {
      data['MY'] = mY!.toJson();
    }
    if (nI != null) {
      data['NI'] = nI!.toJson();
    }
    if (nL != null) {
      data['NL'] = nL!.toJson();
    }
    if (nO != null) {
      data['NO'] = nO!.toJson();
    }
    if (nZ != null) {
      data['NZ'] = nZ!.toJson();
    }
    if (oM != null) {
      data['OM'] = oM!.toJson();
    }
    if (pA != null) {
      data['PA'] = pA!.toJson();
    }
    if (pE != null) {
      data['PE'] = pE!.toJson();
    }
    if (pF != null) {
      data['PF'] = pF!.toJson();
    }
    if (pH != null) {
      data['PH'] = pH!.toJson();
    }
    if (pK != null) {
      data['PK'] = pK!.toJson();
    }
    if (pL != null) {
      data['PL'] = pL!.toJson();
    }
    if (pS != null) {
      data['PS'] = pS!.toJson();
    }
    if (pT != null) {
      data['PT'] = pT!.toJson();
    }
    if (pY != null) {
      data['PY'] = pY!.toJson();
    }
    if (qA != null) {
      data['QA'] = qA!.toJson();
    }
    if (rO != null) {
      data['RO'] = rO!.toJson();
    }
    if (rS != null) {
      data['RS'] = rS!.toJson();
    }
    if (sA != null) {
      data['SA'] = sA!.toJson();
    }
    if (sE != null) {
      data['SE'] = sE!.toJson();
    }
    if (sG != null) {
      data['SG'] = sG!.toJson();
    }
    if (sI != null) {
      data['SI'] = sI!.toJson();
    }
    if (sK != null) {
      data['SK'] = sK!.toJson();
    }
    if (sM != null) {
      data['SM'] = sM!.toJson();
    }
    if (sV != null) {
      data['SV'] = sV!.toJson();
    }
    if (tC != null) {
      data['TC'] = tC!.toJson();
    }
    if (tH != null) {
      data['TH'] = tH!.toJson();
    }
    if (tN != null) {
      data['TN'] = tN!.toJson();
    }
    if (tR != null) {
      data['TR'] = tR!.toJson();
    }
    if (tT != null) {
      data['TT'] = tT!.toJson();
    }
    if (tW != null) {
      data['TW'] = tW!.toJson();
    }
    if (uS != null) {
      data['US'] = uS!.toJson();
    }
    if (uY != null) {
      data['UY'] = uY!.toJson();
    }
    if (vE != null) {
      data['VE'] = vE!.toJson();
    }
    if (yE != null) {
      data['YE'] = yE!.toJson();
    }
    if (zA != null) {
      data['ZA'] = zA!.toJson();
    }
    return data;
  }
}

class AD {
  String? link;
  List<Flatrate>? flatrate;

  AD({this.link, this.flatrate});

  AD.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    if (json['flatrate'] != null) {
      flatrate = <Flatrate>[];
      json['flatrate'].forEach((v) {
        flatrate!.add(Flatrate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['link'] = link;
    if (flatrate != null) {
      data['flatrate'] = flatrate!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Flatrate {
  String? logoPath;
  int? providerId;
  String? providerName;
  int? displayPriority;

  Flatrate(
      {this.logoPath,
        this.providerId,
        this.providerName,
        this.displayPriority});

  Flatrate.fromJson(Map<String, dynamic> json) {
    logoPath = json['logo_path'];
    providerId = json['provider_id'];
    providerName = json['provider_name'];
    displayPriority = json['display_priority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['logo_path'] = logoPath;
    data['provider_id'] = providerId;
    data['provider_name'] = providerName;
    data['display_priority'] = displayPriority;
    return data;
  }
}