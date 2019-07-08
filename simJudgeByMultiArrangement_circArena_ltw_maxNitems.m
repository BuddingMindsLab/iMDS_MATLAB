function [estimate_RDM_ltv,simulationResults,story]=simJudgeByMultiArrangement_circArena_ltw_maxNitems()
%% test variables
itemPos_test = [-0.47574590062771893 0.6682920107229295; 0.9498516139040716 0.8178013277468763; -0.883351179590929 -0.8925415421279062; 0.6569846503554722 -0.1723846601460466; 0.45527871462463865 0.5180771211272932; -0.4212044356063249 -0.25462264304388116; 0.44563099762616587 0.903468954920871; -0.7882176465672521 -0.10830097544045159; 0.88565629013524 0.12909032195835968; 0.4980733987023058 -0.6034542090938828; -0.00804164333516133 0.6873706776469679; 0.19999819290054788 0.7672876807045841];
itemPos_test(:,:,2) =  [-0.814752230207324 0.9530336241147703; -0.0007826957015832914 0.5344949960378613; -0.7008095457819825 0.6342089972261908; -0.4982895917215473 -0.9545986593280509; 0.6110782307330134 -0.35301398240471005; -0.09444074852252338 0.37112970125632216; 0.31019630800021813 0.32312571376816135; 0.32612445821008573 0.41682842692273625; 0.47768356294228176 0.4950296132681413; 0.9734589701578087 0.6386905919029504; -0.8625777788080693 0.35043794871421063; 0.019077025917328072 0.44213533673324634];

itemPos_test(:,:,3) =  [0.10615403991782246 0.1390327139544143; -0.19351914550085403 -0.9423466963978717; 0.3263879133073897 0.653704275521183; -0.8173532190734616 -0.4608109095014403; 0.4735967934610972 -0.3623289154621758; -0.8965704353610007 -0.18560266519096214; -0.8606322808580495 0.3142974861395813; 0.6548035086046975 -0.9628041823109132; -0.8460878711853785 -0.31747466684662684; -0.621713352689401 0.155123444261132; 0.007480935495890684 -0.9088870773011939; 0.7013252410711082 0.9937528242679206];

itemPos_test(:,:,4) =  [-0.05212276521993964 0.7441676280942238; 0.945218751579064 0.9129523264802608; -0.019716321956061655 -0.9448603458978238; -0.5636228468035531 0.3994944167421093; -0.5127195681287833 -0.06631648743320873; -0.9126250488062337 -0.9649473639882313; -0.818683997322909 -0.5784988481932363; 0.44118230340045317 -0.6726453175312128; -0.640441082812008 -0.8325178295418829; 0.052691151470848574 0.29011191793004754; 0.4570905768476159 -0.22343982849978405; -0.5844056279812357 0.8159949338078447];

itemPos_test(:,:,5) =  [0.10555196217275187 -0.47215553077418604; 0.5879751972929608 0.5343111955516744; -0.6987974346836288 -0.18696096655070638; 0.2951071312667297 0.6752356665344961; -0.2993443976151302 -0.23704352998687894; -0.5863928729270997 0.3153215755965255; 0.6976425251777101 -0.31147916090780736; -0.12770571196847436 0.25022818615669573; 0.08962324649228348 0.9155389648116172; 0.8045749315042032 -0.677602920571226; 0.8534792326503051 -0.23623778695307496; 0.39598573137217397 0.7370044896988874];

itemPos_test(:,:,6) = [-0.626941329652063 -0.4250799244248509; -0.6448920851317634 -0.2823380413102261; -0.1513100247687369 0.2893875207003693; -0.7010638641322362 -0.42094612496218664; -0.6356614482992964 -0.5469411831224027; 0.9909661114702764 0.11453339368491533; 0.8697962837803987 0.6717413387379758; 0.3180904322060272 0.8213428511548033; 0.46778281462349147 0.0860161172616849; 0.03765200119118006 0.18629932036592223; -0.3747537269472532 -0.6312463401660795; -0.026957812759059507 0.1413430748855633];

itemPos_test(:,:,7) = [-0.6849085111991089 -0.15117372595036405; 0.9790213748339882 0.5812688388163569; -0.26849109981619645 0.12688309071474024; 0.4956037890595324 -0.21327153881441796; -0.306632946895254 0.9839821025521625; 0.7092960711061413 0.05837137475545995; 0.3155557134081106 -0.7400884312757272; -0.4156379009550528 0.3681143858135685; 0.4733455357586682 -0.43393986897976844; -0.5480744897653196 -0.4019214131108504; -0.7334494791345423 -0.9244388165962649; -0.875276324361262 -0.6463514455853294];

itemPos_test(:,:,8) = [0.008802101142370677 -0.7507060560357219; 0.5569145808009086 0.5244368146796312; 0.5583172055610803 -0.17682200332204023; -0.8939000018428067 -0.44264170946450077; 0.42218388537912177 0.01830998936552186; 0.3075826751364006 0.0389030724146231; 0.1210422095569661 0.7780787105990459; -0.793882858011834 0.17558629918014246; 0.24339950150875533 -0.20055342330197257; 0.509024872407527 0.10641191713167109; -0.057582547946155804 -0.747405529449443; 0.9175021191886465 0.34833094653602825];

itemPos_test(:,:,9) =  [0.3972401175469147 -0.5133494897510888; 0.9396406575394634 0.8276464298815558; -0.9407943530321259 -0.26316511442396995; -0.0013226412929845388 0.6839211051712908; 0.004586631444985834 0.28506650164659897; -0.010953527017794507 0.8693846014965452; -0.4700735836696084 0.7285472185324895; -0.5207916321116743 0.5972253571647703; 0.616324616591396 -0.903056686047516; 0.00029386145674648034 -0.16608029692465598; -0.8884593699972085 -0.22488488763538395; -0.13562317840779436 -0.8609161899990376];

itemPos_test(:,:,10) =  [-0.5203955467632695 -0.5775252006926783; -0.5466391594450408 0.10159448938899507; -0.054632186250132 -0.6443440993553446; 0.4191284666003827 0.5561178047133681; 0.18131985313339438 -0.6503933738256598; -0.8273135035446679 0.7870291301042291; -0.3125907808504311 -0.48454184450685145; -0.3587085356871984 0.13765008875395934; -0.11244650474828455 -0.8808568404976267; -0.07419909666930646 -0.0904679419110237; -0.9980697378142032 -0.004530318672007372; -0.17884687307261005 -0.18069592934262513];

itemPos_test(:,:,11) =   [-0.4919689704950174 0.8734347376050495; 0.9950220048848961 -0.9882728207198426; -0.8994717869943012 -0.2651508265057927; 0.7610523840688148 -0.6840524603374709; 0.6656900008816511 0.6499821950402571; -0.34918264312699065 -0.743661764599741; -0.8749396911767036 -0.3423366678667945; 0.18517913208604386 -0.4001639305479052; 0.2755127153744954 0.875612600166209; 0.07523835754877473 0.7380933286775337; 0.13323684060020358 -0.6623291420406325; -0.9002164934783261 -0.5572211759882397];

itemPos_test(:,:,12) = [-0.6746135134050573 0.22679138005395227; -0.8212347517320526 -0.052500659094695035; 0.2416103310976152 0.747816491848682; 0.39320635480806976 0.5822590980959186; -0.8199662002732047 -0.389410534518841; -0.4335651829682603 -0.726112597075534; -0.8045989292551643 -0.36345995816909027; 0.14233500157302292 0.8827723020965053; -0.5966090538732434 -0.3266246715282306; -0.954339760366254 0.856417016696333; -0.47440080696586984 -0.31922343375178786; -0.3804363829368014 0.8541463864947729];

itemPos_test(:,:,13) =   [0.13586479279282204 0.632772088825478; -0.7290958598550799 0.1736182677733613; -0.9276280724309847 -0.7673244783930901; 0.042087722712073505 -0.908227662317119; 0.29126724866201537 -0.9954243564044116; 0.7885028675745125 0.7529536775087309; -0.051337503389269123 0.3682923791006849; 0.11820249424498175 -0.2589739836606366; -0.6119464361922025 -0.796683817803667; -0.32865744088891025 -0.02289459679178618; 0.26370367081027735 0.25832221231423835; 0.3291521935540087 0.24115085432976868];

itemPos_test(:,:,14) =  [0.5101511002536785 -0.23407053835499747; -0.5224225680183798 -0.8097560756715798; 0.27054370903796654 -0.09043321584005226; -0.7672285749085768 0.8189685334453793; -0.09594479817678492 0.11891938383145306; 0.45419116543360594 0.09616966219398049; 0.3719924205414993 -0.47927777221684176; -0.1925799550819347 -0.41082753693777874; -0.9943796026653584 0.3492297854889501; -0.11533070212344132 0.005549391271281401; -0.07906628415767525 -0.8493914744125084; -0.5569534530170057 0.44332831201411826];

itemPos_test(:,:,15) =  [0.8465339197040429 0.2625766950390376; 0.21958220391717442 -0.3342470337681145; 0.17258099458556808 -0.4628148019278091; 0.25970342390910783 -0.7995103401662875; -0.12669048287123763 0.3286479090005574; -0.8532414071904966 -0.10826188429254668; 0.9189106168924555 -0.9363527127902258; 0.6801942293960159 0.011047821271049862; -0.2678544850811302 0.07324272787837427; 0.4510782765111654 0.35810063944675896; 0.07461344840602835 -0.8845735896892257; -0.27399630096725724 0.9479669542245073];

itemPos_test(:,:,16) =  [0.3042082079005728 -0.8823329877434949; 0.9548999127465914 0.38390702598598625; 0.9285758477660948 -0.5369950853465861; -0.8929167802674081 -0.33494080263082027; -0.9757108122150899 0.47690984039366646; 0.9216335510794815 -0.48022711205091695; -0.36866658802496355 0.13250751203654043; 0.21421765661446024 -0.6669061765565625; -0.2347028227895871 -0.8911438174880433; -0.5831381914647165 -0.6983479207929564; 0.7307319928520597 0.07358405235271626; 0.0843456519467003 0.319010057572648];

randNums = [0.6006966286213917 0.9200912867178763 0.5875305444028074 0.5011086861071219 0.7957966987264736 0.8417423281439527 0.8453939604821639 0.5908497652123952 0.99812077762944 0.7331843827189659 0.4048923274704891 0.2212536109295088 0.13084136587190132 0.9758465117316119 0.1538669284808335 0.8250638789385106 0.12006757298108373 0.45323718205598484 0.3946925362034852 0.41164113780737166 0.27919349042272745 0.8341785222053661 0.9193968022115068 0.36590248226453825 0.4531691476107934 0.5021622256093301 0.17919773492642843 0.022400793631311977 0.5711896056906971 0.6463529715234152 0.21549252050354284 0.29053934569441076 0.6405258997930529 0.755692318520558 0.10694141704451132 0.5827820460846121 0.45687700745479887 0.033801451881259714 0.1477050724452742 0.9733298484041135 0.15392591148375956 0.9009711637846058 0.25334703610382014 0.6424734244232466 0.9998044242927873 0.7449252550086429 0.13284285072456037 0.3998277687630495 0.7579158570750965 0.9604186026079494 0.8506136213434239 0.7138929910578802 0.615758075073728 0.5337571656327066 0.22023368873239846 0.7669823111795744 0.6559799729059768 0.24653201330577013 0.7982297454940144 0.13091306203477515 0.03713067256730673 0.6258816311910165 0.9375227852492451 0.6412227809818929 0.08684756073757915 0.367070151346659 0.13869665694169642 0.5493210352325151 0.24830532834620112 0.7004429886967872 0.07597326450880526 0.2738470789232117 0.488933876479724 0.08209361674708093 0.8155887036131702 0.7573079365911726 0.8630414674333609 0.7865479406877421 0.5936901528104196 0.8963105349978866 0.8651550964183129 0.3856655725536775 0.2733876113844719 0.15856657533694074 0.6519476832617485 0.3809014992527553 0.42130591436689246 0.3309350291712766 0.7934491787565889 0.8411688248524196 0.7185504831951827 0.10798635526110822 0.16624846493218104 0.8620697560101516 0.5149002640322152 0.8544878060270567 0.8560121697275872 0.04682154775150571 0.654183362700069 0.9964175770533703 0.962070536868954 0.16328287567009359 0.8936969352419378 0.3869595434702685 0.3807586059855069 0.09967700031383597 0.26316146287076514 0.20869629294928638 0.6369812598884576 0.8426889424246283 0.6239609711500251 0.9463458925504086 0.46784516735072257 0.013972463059703566 0.9321035750327528 0.42456379379653153 0.9687111347015015 0.2573768375128582 0.7868293433302486 0.3311341969669096 0.08190433685047127 0.26723002141673324 0.057958793461975744 0.8137673475869731 0.01619349146917859 0.0978984839448015 0.9609049901776036 0.6231598867963536 0.43686139133281665 0.8907808366482537 0.7962912269866345 0.4558094987184732 0.17195967888304964 0.09731296615876028 0.3041893747217086 0.1539010482682005 0.04233642045230401 0.4770907428500839 0.45710876559159797 0.3257138314512391 0.7733027098142633 0.5239728955252653 0.7452642919039726 0.5817410841857422 0.8336018630405205 0.380120994311409 0.8634763454748792 0.2863975391521697 0.5351845474357788 0.8908137484633946 0.6174073179069981 0.4154433038391563 0.4909771877212292 0.3843094591022326 0.7189671864010913 0.30456152493645594 0.16392647153982776 0.3549222444612459 0.546200256253712 0.46620130958973094 0.9176336054067669 0.6374144888818549 0.8159520378759477 0.4543541684043513 0.534910917571243 0.9888845900045248 0.7665489349669037 0.22357966639331184 0.5332554521482489 0.12577935415927066 0.49483536766921166 0.8673825710481445 0.8659289137998362 0.3772734030263386 0.6612942368594706 0.5155530749743913 0.4003546754618059 0.021412554013243823 0.21955556269140697 0.5192885613134656 0.11994611759100848 0.718522404354113 0.07707030210908472 0.37755234877283206 0.13343526003606243 0.7212870230318525 0.9922244835479993 0.730491711933474 0.7245800516205751 0.7753687790637716 0.4377146247886917 0.0719780955539766 0.396143975997449 0.6607956142632397 0.5121786010030975 0.07339938190853201 0.573284952822564 0.3267177202796855 0.17320763311201093 0.799073630256068 0.024314482572966867 0.3192126146610822 0.7026974917726924 0.7594588270968233 0.8840218689074147 0.30163057857073916 0.9458216798528049 0.8552416015110862 0.339774541343394 0.19936590258383113 0.4173092900548383 0.36324954586399794 0.16902221438941822 0.06202958210948051 0.6081279466060048 0.2897180696309668 0.6959295253699856 0.9190889479595403 0.6178250881928384 0.13890435982451999 0.8901006040956086 0.7806449129576257 0.5995696704713754 0.6079075164274192 0.8616025040388356 0.4442162214665224 0.9548321996429404 0.8641894344923143 0.9123864746798325 0.26267820420113186 0.5676095999426216 0.95333535311374 0.4259729001710867 0.9411140884047976 0.7619754439895695 0.08162173822914454 0.906041108412239 0.13692609207598094 0.9015536906341253 0.27178871642462477 0.9265616005787652 0.39612692303437314 0.7056638535871517 0.9399137138848184 0.5215572966300656 0.21347720234177336 0.691348310778994 0.5265739337672665 0.9068841776276668 0.9599512173385896 0.8929320533068228 0.6986210004999106 0.40536039338518093 0.9119191470587127 0.39746660259876687 0.27365521492512024 0.7068232317313486 0.6165762820153273 0.6393371174980864 0.46585869697543003 0.21406533380795623 0.8762843392630638 0.7749667307517695 0.7525098323838897 0.3548389605389709 0.8981819607108593 0.24476147403189497 0.6180859120150641 0.38961821639585437 0.1751977531011617 0.7767774553059354 0.8125302164909002 0.35204590653735357 0.9846332985071599 0.9767780332167083 0.11810646718072804 0.13856961285899727 0.9308473795766179 0.18245681429424 0.5348625648651321 0.8729216621455346 0.35576075934119744 0.7607869288197728 0.7461016598516679 0.3624028052851137 0.9051563291146273 0.2689517298200833 0.26490465806248553 0.8175821513792338 0.09536549443481301 0.965835584889003 0.9557909458873355 0.6212072340411012 0.31152935592471787 0.33239610291928223 0.269321055654709 0.20220440500425496 0.32472489873513555 0.8209916153160943 0.07684691242094388];
randI = 1;

test_string = '';

%% control variables
evidenceUtilityExponent=10;
minRequiredEvidenceWeight=.5;
dragsExponent=1.2;


%% preparations
imageData_test = [1:92];
nItems=numel(imageData_test);
nPairs=(nItems^2-nItems)/2;


%% trial item-set construction by "lift the weakest" heuristic

% show evidence utility as a function of evidence weight
w=0:.001:2;     %% this is unused! %%

% prepare conversion from lower-triangular-vector to square indices
[verIs,horIs]=ndgrid(1:nItems,1:nItems);
verIs_ltv=vectorizeSimmat(verIs);
horIs_ltv=vectorizeSimmat(horIs);

% prepare conversion from square to lower-triangular-vector indices
ltvIs_ltv=1:numel(horIs_ltv);       %% this is unused! %%
%ltvIs_sq=squareSimmat(ltvIs_ltv);

% initialization
subjectWork_nItemsArranged=0;
subjectWork_nPairsArranged=0;
subjectWork_nDragsEstimate=0;

minEvidenceWeight=0;
evidenceWeight_ltv=zeros(size(verIs_ltv)); % before the first trial, there is no evidence.
%cTrial_itemIs=1:nItems;
distMatsForAllTrials_ltv=[];

weakestEvidenceWeights=[];
meanEvidenceWeights=[];


%% multiple arrangement trials
trialI=0;
while trialI<3 && minEvidenceWeight<minRequiredEvidenceWeight &&... 
      (any(evidenceWeight_ltv==0)||etime(clock,trialStartTimes(1,:))<9000*60) % trial loop

    %test_string = strcat(test_string, 'evidenceWeight_ltv\n', string(strjoin(string(evidenceWeight_ltv))), '\r\n');
  
    % estimate the current evidence utility for each pair
    evidenceUtility_ltv=1-exp(-evidenceWeight_ltv*evidenceUtilityExponent);
    evidenceUtility_sq=squareform(evidenceUtility_ltv);
  
    % choose first pair to include 
    % (to ensure that the trial can be aligned to previous trials, this
    % pair is chosen randomly the ones for which we already have some
    % evidence...
    evidenceLOG_ltv=evidenceUtility_ltv>0;
    
    % ...among these we choose the one whose two items, paired
    % with other items, reach the largest number of zero-evidence pairs.)
    
    if any(evidenceLOG_ltv)
        % there are pairs we already have evidence for.
        evidenceUtility_sq_nan=evidenceUtility_sq;
        evidenceUtility_sq_nan(logical(eye(nItems)))=nan;
        nObjEachObjHasNotBeenPairedWith = nansum(evidenceUtility_sq_nan==0);
        nZeroEvidencePairsReachedByEachPair=repmat(nObjEachObjHasNotBeenPairedWith',[1 nItems])+repmat(nObjEachObjHasNotBeenPairedWith,[nItems 1]);
        nZeroEvidencePairsReachedByEachPair(logical(eye(nItems)))=0;
        nZeroEvidencePairsReachedByEachPair_ltv=squareform(nZeroEvidencePairsReachedByEachPair);
        
        % this should be a row vector now (verify)
        nZeroEvidencePairsReachedByEachPair_ltv(~evidenceLOG_ltv)=0;
        [maxVal,maxI] = max(nZeroEvidencePairsReachedByEachPair_ltv);
        maxIs=find(abs(nZeroEvidencePairsReachedByEachPair_ltv-maxVal) < 0.001);
        maxI=maxIs(ceil(randNums(randI)*numel(maxIs)));
        %test_string = strcat(test_string, 'maxIs 212\n', string(strjoin(string(maxIs))), '\r\n');
        %test_string = strcat(test_string, 'index 212\n', string(strjoin(string(ceil(randNums(randI)*numel(maxIs))))), '\r\n');
        %test_string = strcat(test_string, 'maxI Second\n', string(strjoin(string(maxI))), '\r\n\r\n');
        randI = randI + 1;
    else
        % there are no pairs we already have evidence for.
        initialPairI=ceil(randNums(randI)*nPairs); % choose random pair
%         test_string = strcat(test_string, 'randNums(randI)\n', string(strjoin(string(randNums(randI)))), '\r\n');
%         test_string = strcat(test_string, 'nPairs\n', string(strjoin(string(nPairs))), '\r\n');
        randI = randI + 1;
    end
    
    item1I=verIs_ltv(initialPairI);
    item2I=horIs_ltv(initialPairI);
    %test_string = strcat(test_string, 'initialPairI', string(strjoin(string(initialPairI))), '\r\n');
    %test_string = strcat(test_string, 'verIs_ltv', string(strjoin(string(verIs_ltv))), '\r\n');
%     test_string = strcat(test_string, 'horIs_ltv', string(strjoin(string(horIs_ltv))), '\r\n');
    % re-initialize current-trial item set
    cTrial_itemIs=[item1I,item2I];
    % test_string = strcat(test_string, 'First\n', string(strjoin(string(cTrial_itemIs))), '\r\n');

    % consider adding additional items
    while numel(cTrial_itemIs)<12
        trialEfficiencies=nan(nItems-numel(cTrial_itemIs)+1,1);
        
        otherItemIs=setdiff(1:nItems, cTrial_itemIs);
        %test_string = strcat(test_string, 'otherItemIs\n', string(strjoin(string(otherItemIs))), '\r\n');
        itemAddedI=[];
        itemSetI=1;

        % consider each other item
        while true % item loop
            % compute trial utility
            if exist('estimate_RDM_ltv')
                estimate_RDM_sq = squareSimmat(estimate_RDM_ltv);
            else
                estimate_RDM_sq = ones(nItems,nItems);
                estimate_RDM_sq(logical(eye(nItems)))=0;
                estimate_RDM_ltv=squareform(estimate_RDM_sq);
            end
            
            
            estimate_RDM_sq_cTrial = estimate_RDM_sq(cTrial_itemIs,cTrial_itemIs);

            if max(estimate_RDM_sq_cTrial(:))>0 % if partial RDM can be aligned

                % if the currently considered trial contains
                % dissimilarities that we have no evidence for, assume that
                % they equal the median of the dissimilarities we do have
                % evidence for in order to estimate the trial efficiency.
                estimate_RDM_sq_cTrial(isnan(estimate_RDM_sq_cTrial))=median(estimate_RDM_ltv(find(~isnan(estimate_RDM_ltv))));
                estimate_RDM_sq_cTrial=estimate_RDM_sq_cTrial/max(estimate_RDM_sq_cTrial(:)); % scale to peak at 1
                %test_string = strcat(test_string, 'cTrial_itemIs\n', string(strjoin(string(cTrial_itemIs))));
                
                if (trialI >= 1)
                    %test_string = strcat(test_string, 'evidenceUtility_sq\n', string(strjoin(string(evidenceUtility_sq))), '\n');
                end
                
                utilityBeforeTrial=sum(squareform(evidenceUtility_sq(cTrial_itemIs,cTrial_itemIs)));
                %test_string = strcat(test_string, 'evidenceUtility_sq\n', string(strjoin(string(evidenceUtility_sq))), '\r\n');
                % test_string = strcat(test_string, 'after_part\n', string(strjoin(string(evidenceUtility_sq(cTrial_itemIs,cTrial_itemIs)))), '\r\n');
                
                % evidenceWeight_ltv is a 1D array
                
                evidenceWeight_sq=squareform(evidenceWeight_ltv);
                
                % evidenceWeight_sq is thus a 2D matrix after squareform
                
                evidenceWeightAfterTrial_sq=evidenceWeight_sq(cTrial_itemIs,cTrial_itemIs)+evidenceWeights(estimate_RDM_sq_cTrial);
                evidenceWeightAfterTrial_sq(logical(eye(numel(cTrial_itemIs))))=0;
                utilityAfterTrial=sum(1-exp(-squareform(evidenceWeightAfterTrial_sq)*evidenceUtilityExponent));
                
                %test_string = strcat(test_string, 'AfterTrial\n', string(strjoin(string(utilityAfterTrial))));
                %test_string = strcat(test_string, 'BeforeTrial\n', string(strjoin(string(utilityBeforeTrial))));
                utilityBenefit=utilityAfterTrial-utilityBeforeTrial;
            else
                %test_string = strcat(test_string, 'In else');
                utilityBenefit=0; % partial RDM couldn't be aligned (all 0) -> cannot estimate trial utility -> assume unuseful trial
            end
            %trialCost=numel(cTrial_itemIs); % number of items (minimum: an underestimate)
            %trialCost=numel(cTrial_itemIs)^2; % number of items^2 (maximum: an overestimate)
            trialCost=numel(cTrial_itemIs)^dragsExponent; % number of items^dragsExponent (our estimate)
            %test_string = strcat(test_string, 'Number 1\n', string(strjoin(string(utilityBenefit))), '\r\n');
            %test_string = strcat(test_string, 'Number 2\n', string(strjoin(string(trialCost))), '\r\n');
            trialEfficiencies(itemSetI)=utilityBenefit/trialCost;

            cTrial_itemIs=setdiff(cTrial_itemIs,itemAddedI); % take out the previously added item (none on the first iteration)
            %test_string = strcat(test_string, 'Second\n', string(strjoin(string(cTrial_itemIs))), '\r\n\r\n');
            if itemSetI==numel(otherItemIs)+1,
                break;
            end

            itemAddedI=otherItemIs(itemSetI);
            cTrial_itemIs=union(cTrial_itemIs,itemAddedI);
            %test_string = strcat(test_string, 'Third\n', string(strjoin(string(cTrial_itemIs))), '\r\n\r\n');
            itemSetI=itemSetI+1;
        end % item loop

        maxVal=max(trialEfficiencies);
        maxIs=find(abs(trialEfficiencies-maxVal) < 0.001);
        %test_string = strcat(test_string, 'maxVal 202\n', string(strjoin(string(maxVal))), '\r\n\r\n');
        %test_string = strcat(test_string, 'trialEfficiencies 202\n', string(strjoin(string(trialEfficiencies))), '\r\n\r\n');
        %test_string = strcat(test_string, 'computed\n', string(strjoin(string(find(trialEfficiencies==maxVal)))), '\r\n\r\n');
        %test_string = strcat(test_string, 'maxImas 365\n', string(strjoin(string(maxIs))), '\r\n\r\n');
        %test_string = strcat(test_string, 'index 365\n', string(strjoin(string(ceil(randNums(randI)*numel(maxIs))))), '\r\n\r\n');
        %test_string = strcat(test_string, 'randNums(randI)\n', string(strjoin(string(randNums(randI)))), '\r\n\r\n');
        %test_string = strcat(test_string, 'numel(maxIs)\n', string(strjoin(string(numel(maxIs)))), '\r\n\r\n');
        maxI=maxIs(ceil(randNums(randI)*numel(maxIs)));
        %test_string = strcat(test_string, 'maxI Third\n', string(strjoin(string(maxI))), '\r\n\r\n');
        randI = randI + 1;

        if maxI==1
            % adding another item would not improve trial efficiency
            if numel(cTrial_itemIs)>=3
                % do not add more items
                break;
            else
                % pair trial has greatest efficiency,
                % but for scale-invariant estimation we need at least
                % 3 items in a trial. add the one that renders the trial
                % most efficient.
                maxVal=max(trialEfficiencies(2:end));
                maxIs=find(abs(trialEfficiencies(2:end)-maxVal) < 0.001);
                maxI=maxIs(ceil(randNums(randI)*numel(maxIs)));
                %test_string = strcat(test_string, 'maxI Fourth\n', string(strjoin(string(maxI))), '\r\n\r\n');
                randI = randI + 1;
                cTrial_itemIs=union(cTrial_itemIs,otherItemIs(maxI));
                %test_string = strcat(test_string, 'Fourth\n', string(strjoin(string(cTrial_itemIs))), '\r\n\r\n');
            end
        else
            % add the item bringing the greatest utility gain
            %test_string = strcat(test_string, 'maxI Fifth\n', string(strjoin(string(maxI))), '\r\n\r\n');
            %test_string = strcat(test_string, 'otherItemIs\n', string(strjoin(string(otherItemIs))), '\r\n\r\n');

            cTrial_itemIs=union(cTrial_itemIs,otherItemIs(maxI-1));
            %test_string = strcat(test_string, 'Fifth\n', string(strjoin(string(cTrial_itemIs))), '\r\n\r\n');
        end
    end % item-set definition for next trial
    
    %test_string = strcat(test_string, 'cTrial_itemIs\n', string(strjoin(string(cTrial_itemIs))), '\r\n\r\n');
    % perfrom the next trial: let subject arrange a set of items 
    trialI=trialI+1;
    
    
    
    trialStartTimes(trialI,:)=clock; % jot down trial beginning time
    
    if false

    else
        
        
        
        % this is where the subject arranges the items
        
        
        
%         [itemPositions,distMat_ltv]=letSubjectArrangeItems_circularArena(imageData(cTrial_itemIs),{instructionString,'\rm(left mouse button to drag, right mouse button to multiselect by clicking or dragging, A & Z to zoom)'},options);
        itemPositions = itemPos_test(:,:,trialI);
        distMat_ltv = pdist(itemPositions);
    end
    trialStopTimes(trialI,:)=clock; % jot down trial termination time
    trialDurations(trialI)=etime(trialStopTimes(trialI,:),trialStartTimes(trialI,:));
    
    % keep track of subject work
    nsItemsPerTrial(trialI)=numel(cTrial_itemIs);
    subjectWork_nItemsArranged=subjectWork_nItemsArranged+nsItemsPerTrial(trialI);
    subjectWork_nPairsArranged=subjectWork_nPairsArranged+(nsItemsPerTrial(trialI)^2-nsItemsPerTrial(trialI))/2;
    subjectWork_nDragsEstimate=subjectWork_nDragsEstimate+sqrt((nsItemsPerTrial(trialI)^2-nsItemsPerTrial(trialI))/2)^dragsExponent;

    % include completed trial evidence in distMatsForAllTrials_ltv
    distMatFullSize=nan(nItems);
    distMatFullSize(cTrial_itemIs,cTrial_itemIs)=squareform(distMat_ltv,'tomatrix');
    distMatFullSize_ltv=vectorizeSimmat(distMatFullSize);
    distMatsForAllTrials_ltv=cat(3,distMatsForAllTrials_ltv,distMatFullSize_ltv);
    %test_string = strcat(test_string, 'distMatsForAllTrials_ltv', string(strjoin(string(distMatsForAllTrials_ltv))), '\r\n\r\n');

    % estimate the dissimilarity matrix from the current evidence
    % (and the current evidence weight for each pair)
    [estimate_RDM_ltv,evidenceWeight_ltv]=estimateRDMFromStackOfPartials(distMatsForAllTrials_ltv,false);
    estimate_RDM_ltv_copy = estimate_RDM_ltv;
    estimate_RDM_ltv_copy(isnan(estimate_RDM_ltv_copy)) = -666;
    evidenceWeight_ltv_copy = evidenceWeight_ltv;
    evidenceWeight_ltv_copy(isnan(evidenceWeight_ltv_copy)) = -666;
    %test_string = strcat(test_string, 'estimate_RDM_ltv', string(strjoin(string(estimate_RDM_ltv_copy))), '\r\n\r\n');
    test_string = strcat(test_string, 'evidenceWeight_ltv', string(strjoin(string(evidenceWeight_ltv_copy))), '\r\n\r\n');
    
    evidenceWeight_sq=squareform(evidenceWeight_ltv);
    
    weakestEvidenceWeights(trialI)=min(evidenceWeight_ltv);
    meanEvidenceWeights(trialI)=mean(evidenceWeight_ltv); 
    
    % visualize current dissimilarity matrix estimate (and evidence weights) 
    if false
        
        if  false
            
        end
    end

    % save this trial's information
    if false
        
    end

    minEvidenceWeight=min(evidenceWeight_ltv);
    
end % trial loop 

% displayStackOfPartialEvidenceDistanceMats(distMatsForAllTrials);
% save('distMatsForAllTrials','distMatsForAllTrials');


%% return dissimilarity estimate (and trial times and arrangements)                
[estimate_RDM_ltv,evidenceWeight_ltv]=estimateRDMFromStackOfPartials(distMatsForAllTrials_ltv,false);
story.distMatsForAllTrials_ltv=distMatsForAllTrials_ltv;
story.trialStartTimes=trialStartTimes;
story.trialStopTimes=trialStopTimes;
story.trialDurations=trialDurations;
story.evidenceWeight_ltv=evidenceWeight_ltv;
story.nsItemsPerTrial=nsItemsPerTrial;

% save all inputs and outputs (except simulation results)
% save(['similarityJudgementData\','arbitrary_initials','_session',num2str(options.sessionI),'_',dateAndTimeStringNoSec_nk],...
%    'imageData','instructionString','options','estimate_RDM_ltv','evidenceWeight_ltv','story');

%% Write test results to file
distMatsForAllTrials_ltv(isnan(distMatsForAllTrials_ltv)) = -666;
estimate_RDM_ltv(isnan(estimate_RDM_ltv)) = -666;
evidenceWeight_ltv(isnan(evidenceWeight_ltv)) = -666;
estimate_RDM_ltv = round(estimate_RDM_ltv, 3);
test_string = strcat(test_string, 'Final_estimate_RDM_ltv', string(strjoin(string(estimate_RDM_ltv))), '\r\n');
evidenceWeight_ltv = round(evidenceWeight_ltv, 3);
test_string = strcat(test_string, 'Final_evidenceWeight_ltv', string(strjoin(string(evidenceWeight_ltv))), '\r\n');
distMatsForAllTrials_ltv = round(distMatsForAllTrials_ltv, 3);
test_string = strcat(test_string, 'Final_distMatsForAllTrials_ltv', string(strjoin(string(distMatsForAllTrials_ltv))), '\r\n');

fid = fopen('test.txt', 'wt');
fprintf(fid, test_string);
fclose(fid);

pageFigure(120);
addHeadingAndPrint(any2str('number of items = ',nItems),'similarityJudgementData\figures');
     
    
%% return simulation results
if false
    simulationResults.r_trueEstimated_multiArangement=corr(simulatedTrueDistMat_ltv(:),estimate_RDM_ltv(:));
    simulationResults.r_trueEstimated_pairwiseArangement=corr(simulatedTrueDistMat_ltv(:),pairwiseDissimMeasures_ltv(:));
    simulationResults.nPairs=nPairs;
    simulationResults.nItems=nItems;
    simulationResults.subjectWork_nItemsArranged=subjectWork_nItemsArranged;
    simulationResults.subjectWork_nPairsArranged=subjectWork_nPairsArranged;
    simulationResults.subjectWork_nDragsEstimate=subjectWork_nDragsEstimate;
else
    simulationResults=[];
end


