#import "@preview/simple-plot:1.1.0": plot
#import "@preview/mousse-notes:2.0.1": *

#set page(paper: "a5")
#set document(title: "MATEMATIKA G1", author: "Kakuk Mihály")

#show: style

#title-page(
	subtitle: "2026. 1. Félév",
	primary: "Budapesti Műszaki- és Gazdaságtudományi Egyetem",
	secondary: "Szilágyi Brigitta",
)

= Halmazelmélet
== Alapfogalmak, alapműveletek
#definition[
	_*Alapfogalmak*_ az alábbiak:
	+ Axióma/posztulátum
	+ Definíció
	+ Nem definiált alapfogalom
	+ Lemma, tétel, állítás, segédtétel
]
#definition[
	A _*halmaz*_ egy nem definiált alapfogalom:
	+ A halmazokat nagybetűvel jelöljük
	+ Elemeiket kisbetűvel
	+ Elemek jelölése: $a in A$
	+ Nem eleme $a in.not B$
]

#definition[
	Azt a halmazt, amelynek egyetlen eleme sincs, *_üres halmaznak_* nevezzük, jele: $diameter$
	Nemüres halmaz $A$: $A != diameter$
]
Nevezetes halmazok:
+ Természetes számok $NN = { a+b | 0,1 in NN| a,b in NN}$
+ Egész számok $ZZ = { a-b | a,b in NN }$
+ Racionális számok $QQ = {p/q | p,q in ZZ | q != 0 } $
+ Valós számok $RR = { lim_(n arrow oo) C_n | C: NN arrow QQ "Cauchy sorozat"  }$
+ Irracionális számok $QQ^* = RR without QQ $ 
+ Komplex számok $CC = {a+b i | a,b in RR }$

#definition[
	Legyenk $A$ és $B$ halmazok. Ha $forall a in A arrow a in B $ akkor azt mondjuk, hogy $A$ *_részhalmaza_* $B$ halmaznak,
	azaz $A subset.eq B$.
]
#proposition[
	Legyenek $A, B, C$ tetszőleges halmazok, ekkor:
	+ $A subset.eq A$ (*reflexív*)
	+ $A subset.eq B and B subset.eq A ==> A = B  $ (*antiszimmetriku*)
	+ $A in B and B in C ==> A in C$ (*tranzitív*) 
]
#definition[
	Legyenek $A$ és $B$ az $X$ alaphalmaz részhalmazai, ekkor:
	$ A union B = { x in X | x in A or x in B } $
	$ A inter B = { x in X | x in A and x in B } $
	$ A without B = { x in X | x in A and x in.not B } $
]
#remark[
	A fentiek alapján látható, hogy a halmazműveletek megfeleltethetők
	bizonyos logikai műveleteknek. Az únió az OR-nak, a metszet az AND-nek, a szimmetrikus differencia ($A xor B$) pedig az XOR-nak.
	
]
#definition[
	$A, B$ halmaz _*diszjunkt*_, ha $A inter B = diameter$
]
#definition[
	$A$ halmaz $B$ halmazra vonatkozó *_komplementer halmaza_* $overline(A) = B without A$
]
#proposition[
	Halmaz komplementerének komplementere önmaga.
	$ overline(overline(A)) = A $
]

#theorem[
	Legyenek $A,B,C in X$
	+ $A union B = B union A $ (*kommutatív*) $A inter B = B inter A $
	+ $A union (B union C) = (A union B) union C $  (*asszociatív*) $A inter (B inter C) = (A inter B) inter C $ 
	+ $ A union A = A$ (*idempotens*) $A inter A = A$
	+ $(A union B)inter C = (A inter C) union (B inter C)$ (*disztributív*) $(A inter B)union C = (A union C) inter (B union C)$
	+ $A union diameter = A quad A inter diameter = diameter$
	+ $A union overline(A) = X quad A inter overline(A) = diameter$
	+ $overline(A union B)=overline(A) inter overline(B)$ (*De Morgan-azonosságok*) $overline(A inter B)=overline(A) union overline(B)$
]
#definition[
	$A$ halmaz _*hatványhalmaza*_ $A$ összes részhalazának halmaza.
]
#proposition[
	Egy $A$ véges halmaz összes részhalmazaink száma $2^(|A|)$.
]
#proof[
	Egy $n$ elemű halmaz esetén $k$ elemű részhalmazt $binom(n,k)$ féleképp választhatunk, tehát az összes részhalmaz száma:
	$ sum_(k=0)^n binom(n,k) $
	Ami a binomiális tétel szerint $2^n$.
]
== Relációk, leképzések, függvények
#definition[
	Az $A$ és $B$ halmazok _*Descartes-féle szorzata*_ $A$ és  halmazok elemeiből álló összes rendezett elempár halmaza.
	$ A times  B = { (a;b) | (a in A) and (b in B)  } $
]
#example[
	Legyen $A={1;2} "és" B={a;b}$, ekkor:
	$ A times B = {(1;a),(1;b),(2;a),(2;b)} $
]
#definition[
	Az $A times B$ szorzathalmaz $T subset.eq A times B$ részhalmazát az $A$ és $B$ közti _*binér relációnak*_ nevezzük.
	Ha $(a;b) in T$ akkor $a$ és $b$ _*relációban vannak*_, azaz $a T b$.
]
#definition[
	Legyen $T subset.eq A times B$ egy reláció.
	$ cal(D)_T = { a in A | exists b in B : (a,b) in T }   "a reláció értelmezési tartománya" $
	$ cal(R)_T = { b in B | exists a in A : (a,b) in T }   "a reláció értékkészlete" $
	$ T^(-1) = { (b;a) | (a,b) in T }   "a reláció inverze" $
]
#pagebreak()
#definition[
	Legyen $A != diameter$. A $T subset_eq A times A $ reláció akkor és csak akkor  _*ekvivalenciareláció*_, ha teljesülnek az alábbiak.
	+ *reflexivitás* - $forall a in A "esetén" (a;a) in T$
	+ *szimmetria* - $"ha" (a;b) in T "akkor" (b;a) in T$
	+ *tranzitivitás* - $"ha" (a;b) in T "és" (b;c) in T "akkor" (a;c) in T$ 
]
#theorem[
	Minden $A times A$ halmazon adott ekvivalenciareláció diszjunkt halmazokra bontja fel az $A$ halmazt, ezeket a diszjunkt halmazokat ekvivalenciaosztályoknak nevezzük.
]
#definition[
	A $T subset.eq A times B$ reláció _*függvény*_ (leképzés), ha
	$ (a;b) in T and (a;c) in T ==> b=c $
	Jelölés: $f: A arrow B$
]
#definition[
	Az $f: A arrow B$ függvény _*bijektív*_ (kölcsönösen egyértelmű, egy-egyértelmű), ha
	+ *injektív* $f(a_1)=f(a_2) ==> a_1=a_2$
	+ *szürjektív* $forall b in B "esetén" exists a in A : f(a) = b$
]
== A számfogalom kiépítése
#proposition(name:[*_Peano-axiómák_*])[\
	Legyen $NN != diameter$, $NN$-t a természetese számok halmazának,
	elemeit természetes számoknak mondjuk, ha:
	+ Legyen adva egy $phi: NN arrow NN$ leképzés,
	+ $phi$ injektív,
	+ $0 in NN$,
	+ $exists.not n in NN $ amire igaz, hogy $phi(n)=0$,
	+ A teljes indukció elve teljesül, azaz ha $H subset.eq NN$ és
		- $0 in H$
		- $n in H ==> phi(n) in H$
	akkor $H = NN$
]
#definition[
	Egy irracionólis, valós szám transzcendens, amelyek nem algebraiak, azaz nem valamely racionális együtthatós polinom gyökei.
	Ilyen a $pi$ és az $e$.
]

#pagebreak()

== A valós számok axiómarendszere
Értelmezzük a valós számok számok halmazán két bináris műveletet, az összeadást $(+)$ és a szorzást $(dot)$, és egy relációt $(>)$
#proposition[
	Tetszőleges $a, b, c in RR$ elemekre igaz, hogy:
	+ $a+b = b+a$ az összeadás *kommutatív*
	+ $a+(b+c) = (a+b)+c$ az összeadás *asszociatív*
	+ $exists 0 in RR quad a+0 = a$ az összeadásnak van *egységeleme*
	+ $forall a in RR exists (-a) in RR quad a+(-a)  = 0 $ az összeadásnak van *inverz eleme*
	+ $a dot b = b dot a$ a szorzás *kommutatív*
	+ $a dot (b dot c) = (a dot b) dot c$ a szorzás *asszociatív*
	+ $exists 1 in RR quad a dot 1 = a$ a szorzásnak van *egységeleme*
	+ $forall a in RR without {0} quad exists 1/a in RR quad a times 1/a  = 1 $ a szorzásnak van *inverz eleme*
	+ $a dot (b+c) = a dot b + a dot c$ szorzás *disztributív* az összeadás felett
	+ $forall a, b in RR quad a < b quad or quad a = b quad or quad a > b$ *trichiotómia*
	+ $forall a,b,c in RR quad (a<b quad and quad b<c) ==> a<c $ *tranzitivitás*
	+ $forall a,b,c in RR quad a<b ==> a+c<b+c$ az összeadás *monoton*
	+ $forall a,b,c in RR and 0<c quad  a<b ==> a dot c<b dot c$ a szorzás *monoton*
	+ $forall a quad exists n in NN : a<n$ *Arkhimédész-féle rendezés*
	+ Legyen $a_n$ monoton növekvő- és $b_n$ monoton csökkenő numerikus sorozat. $ inter.big_(n=1)^oo [a_n;b_n] != diameter $
]


Ha egy halmazban definiált két műveletre és egy relációra igazak a fenti axiómákból az alábbi sorszámúak, akkor az adott algebrai struktúrát alkotjál:
- 2-4: Csoport
- 1-4: Abel-csoport (kommutatív csoport)
- 1-9: Test
- 1-13: Rendezett test
- 1-14: Arkimédészien rendezett test
- 1-15: Teljes rendezett test. 

#theorem[
_*$Q$ és $Q^+$ sűrű.*_
]

== Halmazok számossága
#definition[
	Ha két halmaz, $A$ és $B$ között létezik bijekció, akko azt mondjuk,
	hogy a két halmaz _*számossága azonos*_. $|A| = |B|$
]
#definition[
	A halmaz _*véges*_, ha $exists n in NN quad |A| = |{1;2;3;4...n}|$ vagy $A=diameter$.
]
Ha nincs olyan $n$ természetes szám amire a fenti feltétel teljesül, és az adott halmaz nem az üres halmaz, akkor a halmaz számossága végtelen. Létezik megszámolhatóan és megszámlálhatatlanul végtelen halmaz. 

#pagebreak()

#theorem[
	A racionális számok halmaza megszámlálhatóan végtelen.
]
#proof[
	Cantor-féle átlós módszer.
]

= Komplex számok

== Fogalmak, definíciók

#definition[
	Legyen $i^2=(-1) $
]


= Sorozatok, sorozatok határértékei

== Def.: (Numerikus) sorozat határértéke

$ a_n: NN^+ arrow RR  $ 
$ exists a in RR quad forall epsilon > 0 quad exists N(epsilon) in NN $
Ahol a a sorozat határérteke,
$ |a_n-a|<epsilon quad n>N(epsilon) $ 
Ugyanígy $a_n: NN^+ arrow CC$ vagy $a_n: NN^+ arrow RR^k quad k in NN^+$ esetén, ahol a határérték:
1.
$ a_n = b_n + c_n i $ 
$ lim_(n arrow oo) a_n = lim_(n arrow oo) b_n + (lim_(n arrow oo) c_n) i $
2. Ahol $bold(e)_j$ vektorok $RR^k$ ortonormális bázisai. (Itt $a^j$ nem hatványozás, csak felsőindexes számozás)
$ bold(a)_n = sum_(j=1)^k a^j_n bold(e)_j $
$ lim_(n arrow oo) bold(a)_n = sum_(j=1)^k (lim_(n arrow oo) a^j_n) bold(e)_j $
== Áll.: Konvergens sorozat korlátos.
Lemma: Véges halmaznak létezik minimuma és maximuma.
A határérték def. szerint:

$ a_n: NN^+ arrow RR  $ 
$ exists a in RR quad forall epsilon > 0 quad exists N(epsilon) in NN $
$ |a_n-a|<epsilon quad n>N(epsilon) $ 
Szóval tetszőleges $n>N(epsilon)$ esetén minden $a_n$ $a$ $epsilon$-sugarú környezetébe esik, aminek korlátai $K=a+epsilon$ és $k=a-epsilon$
Mivel véges szám esik a sugaron kívül, a sugaron kívül eső értékeknek $S = {k | k<N(epsilon) | k in NN^+}$ is lesz felső- és alsó korlátja. A felső korlátok közül a nagyobb, az alsó korlátok közül a kisebb lesz a teljes sorozat felső- és alsó korlátja.

== Def.: Műveletek numerikus sorozatokkal
Legyenek $a_n$ és $b_n$ numerikus sorozatok.
$ (a_n) + (b_n) = (a_n + b_n) $
$ lambda (a_n) = (lambda a_n)  $
$ (a_n) dot (b_n) = (a_n dot b_n) $
$ (a_n)/(b_n) = (a_n/b_n) quad b_n !=0 $


Legyenek $a_n$ és $b_n$ konvergens sorozatok, ahol $lim_(n arrow oo) a_n = a$ és $lim_(n arrow oo) b_n = b$
$ lim_(n arrow oo) a_n + b_n = a+b $
$ lim_(n arrow oo) lambda a_n = lambda a $
$ lim_(n arrow oo) a_n dot b_n = a dot b $
$ lim_(n arrow oo) a_n / b_n = a/b quad quad b!=0 quad b_n != 0 $

== Biz. 1.:
Áll.: $ lim_(n arrow oo) a_n + b_n = a+b $
Mivel $a_n$ konvergens $arrow.double$ $|a_n-a|<epsilon/2 "ha" n>N_1(epsilon/2)$

Mivel $b_n$ konvergens $arrow.double$ $|b_n-b|<epsilon/2 "ha" n>N_2(epsilon/2)$

$ |(a_n+b_n)-(a+b)| = |(a_n-a)+(b_n-b)| <= |a_n-a|+|b_n-b| < epsilon $
Ha $n>max(N_1(epsilon/2), N_2(epsilon/2))$
== Biz. 2.:
Áll.: $ lim_(n arrow oo) lambda a_n = lambda a $
Ha $lambda != 0$ ($lambda = 0$ triviális)

Mivel $a_n$ konvergens $arrow.double$ $|a_n-a|<epsilon/(|lambda|) "ha" n>N(epsilon/(|lambda|))$
$$
$ |lambda a_n - lambda a| = |lambda||a_n-a| < epsilon "ha" n>N(epsilon/(|lambda|)) $ 
== Biz. 3.:
Legyen $sup a_n = K$. 
Mivel $a_n$ és $b_n$ konvergens, legyen $|a_n -a|<epsilon/(2|b|+1) quad forall n>N_1(epsilon/(2|b|+1))$ és $|b_n-b|< epsilon/(2|K|) quad forall n>N(epsilon/(2|K|))$ esetén.

$ |a_n dot b_n - a dot b| = |a_n dot b_n - a_n dot b +a_n dot b - a dot b| $
$ |a_n dot (b_n-b) + b (a_n -a)| <= |a_n||b_n-b|+|b||a_n-a| $
$ |a_n dot (b_n-b) + b (a_n -a)| <= |K||b_n-b|+|b||a_n-a| < epsilon $
$ |a_n dot b_n - a dot b| < epsilon $

== Biz 4.:
$ sup b_n = K $
Először lássuk be, hogy $b_n!=0 and b != 0$ esetén $lim_(n arrow oo) 1/(b_n) = 1/b$
$ |1/(b_n)-1/b| = |(b_n-b)/(b_n b)| <= ((|b_n-b|)/(|K||b|)) < epsilon $
Innetől lásd. Biz. 3.
== Tétel: Rendőrtétel/Szendvicstétel
Legyen $a_n, x_n, b_n$ konvergens numerikus sorozat, ahol $lim_(n arrow oo) a_n = lim_(n arrow oo) b_n = a$ és arbitráris index után $a_n<=x_n<=b_n$, akkor $lim_(n arrow oo) x_n = a$ 
== Biz.:
$ a_n <= x_n <= b_n $
$ a_n-b_n <= x_n - b_n <= 0 $
$ 0 <= |x_n-b_n| <= |a_n-b_n| < epsilon quad quad "ha" n>N(epsilon) $
$ ==> x_n - b_n arrow 0 quad n arrow oo $
$ x_n-a arrow 0 quad n arrow oo $
$ x_n arrow a quad n arrow oo $ 
== Áll.: Konvergens nemnull sorozat jeltartó.
== Biz.:
Legyen $a_n$ konvergens nemnull numerikus sorozat, és $lim_(n arrow oo) a_n= a >epsilon>0$. Akkor $a_n in [a-epsilon, a+epsilon] quad forall n>N(epsilon)$. Ha $a>0$, akkor $a+epsilon$ mindig pozitív, és $a-epsilon$ csak akkor lehetne negatív, ha $epsilon > a$ (def. szerint nem lehet). Az ellentétes eset triviális.
== Áll.: Korlátos sorozat és nullsorozat szorzata nullsorozat.
Legyen $a_n$ korlátos- és $b_n$ nullsorozat. Def. szerint:
$ exists K quad |a_n| < K quad forall n $
$ -K b_n <= a_b dot b_n <= K b_n $
Ami rendőrelv szerint:
$ lim_(n arrow oo) a_n b_n = 0 $

Def.: Bővitett valós számok.
$ RR_b = RR union {-oo; +oo}$
$ forall a in RR quad -oo<a<+oo$

== Def.:
$ lim_(n arrow oo) a_n = +oo <=> forall K in RR quad exists N(k) quad a_n>K "ha" n>N(K) $
$ lim_(n arrow oo) a_n = -oo <=> forall k in RR quad exists N(k) quad k>a_n "ha" n>N(k) $
Lemma: ha $ lim_(n arrow oo) a_n = +-oo $ akkor $a_n$ divergens, de van határértéke.

== Tétel: monoton korlátos sorozat konvergens.
== Biz. 1.: monoton növekvő korlátos
$ a = sup a_n $
Legyen
$ epsilon>0: quad a-epsilon<= a_n_0 < a_n <= a < a + epsilon $
$ a-epsilon < a_n < a+epsilon $
$ |a_n-a| < epsilon $
Ahol $n_0<n$.
== Biz. 2.: monoton csökkenő korlátos
$ a = inf a_n $
Legyen
$ epsilon>0: quad a-epsilon<= a < a_n<= a_n_0  <= a + epsilon $
$ a-epsilon < a_n < a+epsilon $
$ |a_n-a| < epsilon $
Ahol $n_0<n$.
== Tétel: monoton nem korlátos sorozatnak van határértéke.
== Biz. 1.: monoton csökkenő nem korlátos
$ forall K in RR quad exists n_0 in NN quad a_n_0 < K $
$ a_n <= a_n_0 <K $
$ a_n < K $

== Biz. 2.: monoton csökkenő nem korlátos
$ forall k in RR quad exists n_0 in NN quad a_n_0 > k $
$ a_n >= a_n_0 >k $
$ a_n > k $

== Def.:
Legyen $k_n$ a természetes számok szigorúan növekvő sorozata, és legyen $a_n$ egy numerikus sorozat.
Ekkor $b_n=a_k_n$ sorozatot $a_n$ sorozat $k_n$ indexsorozatú részsorozatának nevezzük.
== Tétel:
Ha egy sorozatnak van határértéke, bármely részsorozatának is van határértéke, és határértékük megegyezik.
== Tétel:
Bármely sorozatnak van monoton részsorozata.

== Def.:
Egy sorozat torlódási pontja az a pont, melynek akármilyen kis sugarú környezetében lesz a sorozatnak pontja, ami tőle különböző indexű.
= Nevezetes határértékek

== Tétel: Boltzano-Weierstrass tétel
Minden korlátos sorozatnak van konvergens részsorozata
Legyen $a_n$ numerikus sorozat.
$ s_n = sup {a_(n+1), a_(n+2), a_(n+3), ...} $
Mivel $a_n$ korlátos, $s_n$ is az. Mivel $s_n$ korlátos és monoton, $s_n$ konvergens.
$ lim_(n arrow oo) s_n =  $
HF: ez a konstrukció $(-1)^n dot n/(n-1)$ sorozatra nézve.
Limesz szuperior
$ t_n = inf {a_(n+1), a_(n+2), a_(n+3), ...} $
$t_n$ határértéke a limesz inferior

== Def.:
Az $a_n$ sorozatot Cauchy-sorozatnak hívjuk, ha $forall epsilon>0 quad exists N in NN$
$quad |a_n-a_m|<epsilon quad forall n,m > N$

== Tétel: Cauchy-kritérium
Egy sorozat akkor és csak akkor konvergens, ha Cauchy-sorozat.

== Nevezetes sorozatok határértékei
Bernoulli-egyenlőtlenség
$ (1+x)^n>= 1+n x "ha" x >= -1 quad n in NN $

== Biz.: teljes indukció
1. $n=1 and n=0 $
$ (1+x)^1 = 1+x $
$ 1=1 $
2. Indukciós feltétel:
$ (1+x)^k >= 1+k x $
3. $k+1$ esetén
$ (1+x)^k dot (1+x) >= (1 + k x)(1+x) $
$ (1+x)^k dot (1+x) >= 1 + k x + x + k x^2 $
$ (1+x)^k dot (1+x) >= 1 + x(k+1) + k x^2 >= 1+ (k+1)x $

== $a^n$
Ha $|a|<1$, akkor $lim_(n --> oo) a_n = 0$. Ha $a=1$, akkor $lim_(n --> oo) a_n = 1$. Összes többi esetben $a_n$ divergens
== Biz.:
Ha $a>1$, akkor $a=1+h quad h>0$
a_n = (1+h)^n
Bernoulli egyenlőtlenség szerint divergens.
Ha $a=1$ vagy $a=-1$, triviális.

Ha $|a|<1$,
$ |a^n| = |a|^n = 1/(1/(|a|^n)) $
$ |a|<1 ==> 1/(|a|) > 1 $
$ (1/(|a|))^n --> oo $
Ha $a< -1$
Otthon bizonyítsd!

== $a ^ (1/n) quad a > 0$
Ha $a>1$

$b_n = a^(1/n) - 1$
$ a = (1-b_n)^n $
Bernoulli egyenlőtlenséggel
$ a >= 1+n b_n $
$ (a-1)/n >= b_n >= 0 $
Rendőrelvvel:
$ lim_(n arrow oo) b_n = 0 $
$ lim_(n arrow oo) a_n = 1 $

Ha $a=1$, triviális.

Ha $0<a<1$:
$ 1/a > 1 $
$ (1/a)^(1/n) = 1/(a^(1/n)) $
Előző szerint 1-hez tart.

== $a_n = a^n n^k$
Hf: n>k
Nullsorozat ha $|a|<1 and k in NN$
$ a_n arrow 0 ==> |a_n| arrow 0 $
$ |a|^n n^k = 1/(1+h)^n n^k = n^k/((sum_(j=0)^n binom(n,j)  h^j )) <= n^k/(binom(n,k-1) h^(k-1))  $

== $n^(1/n)$
#import "@preview/simple-plot:1.1.0":
plot

= Egyéb híres határértékek

== Euler-határérték
Valami hihetetlen bullshit bizonyítás a számtani és mértani közepekkel, írd meg később

$==> a_n= (1+1/n)^n$ korlátos és monoton, tehát konvergens.

== Fibonacci sorozat
$f_1= 0$ $f_2=1 quad f_(n+2) = f_(n+1)+f_n $

Tegyük fel, hogy $f_n$ mértani sorozat.
$ a q^(n+2) = a q^(n+1) + a q^n $
$ q^2 = q + 1 $
$ q_1 = (1+sqrt(5))/2 = phi quad q_2 = (1 - sqrt(5))/2 = psi $
$ f_n = psi^n/sqrt(5) - phi^n/sqrt(5) $

== Tétel: e transzcendens.
DOGÁN LE KELL ÍRNI MINDEN LEVEZETÉST!!!!

= Valós-valós függvények
$ f: I subset.eq RR arrow J subset.eq  $
$ (a,b) in T and (a,c) in T ==> b=c $


== Nevezetes függvények
+ Polinóm $sum_(i = 0)^n a_i x^i$
+ Logaritmus $ log_a x quad x in RR^+ and a in RR^+ -  {1}$
+ Exponenciális $a^x quad a in RR^+ -  {1}$
+ Szögfüggvény $sin(x), cos(x), tan(x), csc(x), sec(x)$
+ Hatványfüggvény $x^alpha$
+ Inverz függvény:
	$ f: A arrow B ==> f^(-1): B arrow A $
	$ f^(-1)(f(x)) = f(f^(-1)(x)) = x quad forall x $
	$ (f^(-1))^(-1) = f $
+ Öszetett függvény: $f circle g = f(g(x))$

== Def.:
Az f fg. $(x_1, f(x_1))$ és $(x_2, f(x_2))$ pontjait összekötő szakasz a függvénygörbe húrjának nevezzük.
Húr egyenlete:
$ arrow(v) = (x_2-x_1, f(x_2)-f(x_1) ) $
$ arrow(n) = (f(x_2)-f(x_1), x_2-x_1) $
stb. stb.

Konvex: bármely két pontját összekötő húr a függvény felett halad

Konkáv:  bármely két pontját összekötő húr a függvény alatt halad


== Def.:

== Tétel: átviteli elv

== Biz.:
Bal oldal $arrow$ jobb oldal:

== Függvények elemi tulajdonságai

#definition[
	Azt mondjuk, hogy ha az $f: I subset.eq RR arrow RR$ esetén $lim_(x arrow a) f(x) = A quad a in I_"max"$ (ahol $I_"max"$ az $I$ elemei által alkotott teljes metrikus tér) ha $ forall epsilon > 0$ esetén $exists delta(epsilon)>0$ hogy $|f(x)-A|<epsilon "ha" |x-a|<delta(epsilon)$
	akkor $f$ függvénynek a határértéke $a$ pontban $A$.
]
#theorem[
	Az *átviteli elv* szerint,
	$ lim_(x arrow a) f(x) = A <=> N_a in D_f and forall x_n: NN^+ arrow N_a  lim_( n arrow oo) x_n = a "esetén" lim_(n arrow oo) f(x_n) = A  $
]
#proof[
Az állítás első része:

$ forall epsilon>0 quad exists delta(epsilon) quad |f(x)-A|<epsilon "ha" |x-a|<delta(epsilon) $
$ x_n arrow a ==> |x_n-a|<delta(epsilon) "ha" n>N(delta(epsilon)) $
$ |f(x_n)-A| < epsilon ==> f(x_n) arrow A  $

Az állítás második része:

Indirekt feltétel;
$
 |x_n-a| < 1/n and |f(x_n)-A| > epsilon
$
$

$
	
]
#theorem[
	Legyen $f$, $g$ függvényekre igaz, hogy:
	$lim_(x arrow a) f(x) = A$ és $lim_(x arrow a) g(x) = B$. Ekkor:
	+ $ lim_(x arrow a) (f+g)(x) = A+B $
	+ $ lim_(x arrow a) lambda f(x) = lambda A $
	+ $ lim_(x arrow a) (f dot g) (x) = A dot B $
	+ $ lim_(x arrow a) (f/g)(x) = A/B quad quad B!=0 $
]
#proof[
	Triviális, átviteli elvvel.
]
#definition(name: "a")[
	Azt mondjuk, hogy az $f$ függvény jobboldali határértéke az $a$ pontban $A$, ha bármely $epsilon>0$ esetén $exists delta>0$ hogy $|f(x)-A|<epsilon$, ha
	$a<x<a+(epsilon)$. Hasonlóan, az $f$ függvény baloldali határértéke az $a$ pontban $A$, ha bármely $epsilon>0$ esetén $exists delta>0$ hogy $|f(x)-A|<epsilon$, ha \	$a>x>a-(epsilon)$.
]
Jobboldali, baloldali határérték jelölése:
$ lim_(x arrow a+) f(x) = lim_(x arrow a^+) f(x) = lim_(x arrow a+0) f(x) $
$ lim_(x arrow a-) f(x) = lim_(x arrow a^-) f(x) = lim_(x arrow a-0) f(x) $
Ha egy függvény valamely pontjában megyezik a baloldali és jobboldali határérték, akkor ott van határértéke, ami megegyezik a bal- és jobboldalival.
#definition[
	Az $f$ függvény határértéke $+oo$-ben $A in RR$, ha $forall epsilon > 0$ $quad exists N(epsilon)$ szám, melyre igaz hogy
	$|f(x)-A|<epsilon$, ha $x>N(epsilon)$.
]
#pagebreak()

#example[

	$f(x)=1/x$
	$quad lim_(x arrow oo) f(x) = 0$
	Legyen $epsilon = 1/100$
	$N(epsilon) = 1/epsilon = 100$
]
#proposition[
	Legyen az $f$ függvény határértéke $a$ pontban $A$. A $g$ függvény értelmezve van az $a$ környezetében, $lim_(n arrow A) g(x) = B$ és $g(x)!=A$.
	Ekkor $lim_(n arrow a) (g circle f)(x) = B$.
]
De mi történik, ha véges pontban a határérték $+ oo$ vagy $-oo$?
#definition[
	Azt mondjuk, hogy az $f$ függvény határértéke az $a$ pontban $+oo$, ha
	$forall N$ esetén $exists delta(N)$ hogy az $f(x)>N$ ha $0<|x-a|<delta(N)$.
	Hasonlóan az $f$ függvény határértéke az $a$ pontban $-oo$, ha
	$forall N$ esetén $exists delta(N)$ hogy az $f(x)<N$ ha $0<|x-a|<delta(N)$.
	
]

HF: végtelenben végtelen, végtelenben negatív végtelen stb.

#definition[
	Egy $f$ függvény _*folytonos*_ az $a$ pontban, ha értelmezve van a pontban és annak egy környezetében,
	és igaz rá, hogy $forall epsilon>0 quad exists delta>0$ amire $|f(x)-f(a)|<epsilon$ ha $|x-a|<delta(epsilon)$
]
#remark[
	A határértékkel ellentétben itt a függvénynek _muszáj_, hogy $a$ benne legyen az értelmezési tartományában.
	Slendriánul úgy is fogalmazhatunk, hogy $lim_(n arrow a) f(x) = f(a)$
]
#proposition[
	Egy függvény egy pontban akkor és csak akkor folytonos, ha abban a pontban balról és jobbról is folytonos.
]

=== Dirichlet-függvény
$ 1_QQ (x) = cases(
	1 "ha" x in QQ,
	0 "ha" x in QQ^*
) $

HF: $x dot 1_(QQ) (x) $ valamilyen lineár kominációval véges számú, megszámlálhatóan végtelen, legyen folytonos. 
#pagebreak()
#theorem[
	A _*Boltzano-tétel*_ szerint: legyen $f: [a;b] arrow RR$ folytonos, és $f(a) dot f(b) < 0$. Ebben az esetben $exists c in [a;b] quad f(c)=0$.
]
#proof[
	Vizsgáljuk meg $f((a+b)/2)$ pontot. Ha $0$, akkor az állítás igaz. Ha $!=0$, akkor vagy negatív vagy pozitív. Amelyik végponttal ellentétes előjelő, vegyuk a $f((a_1+b_1)/2)$ értéket, stb.. Ezeket a vizsgált intervallumokat jelöljük mint $I_n = [a_n;b_n]$. \ Ebben az esetben $b_n-a_n = (b-a)/(2^n)$. A Cantor-axióma szerint ez egy pontra konvergál. $a_n arrow c$ és $b_n arrow c$. Az átviteli elv szerint ekkor $f(a_n) arrow f(c)$ és $f(b_n) arrow f(c)$. Mivel $f(a_n)$ és $f(b_n)$ előjele ellentétes, az egyetlen lehetséges határérték $f(c)=0$.
]
#theorem[
	A _*Boltzano-Darboux-tétel*_ szerint ha $f:[a;b] arrow RR$ folytonos, akkor felvesz minden $c in [f(a);f(b)] $ értéket (feltéve hogy $f(a)!=f(b)$). $<=>$ $forall I subset [a;b]$ esetén $f(I)$ is intervallum.
]
#proof[
	Legyen $y_1,y_2 in f(I)$, és $y_1<y_2$. $exists x_1 quad f(x_1)=y_1$ és $exists x_2 quad f(x_2)=y_2$ (létezik ősképük). Legyen $x_1<x_2$. $x_1!=x_2$, mivel ellentétes esetben $f(x)$ nem függvény.
	$y in (y_1;y_2)$ esetén legyen $hat(f)(y) = f(x)-y$ folytonos függvény. $hat(f)(x_1) = f(x_1)-y = y_1-y$, ami negatív és $hat(f)(x_2) = f(x_2)-y = y_2-y$ pozitív. A Boltzano-tétel szerint ekkor $exists x in (x_1;x_2) quad hat(f)(x) = 0 = f(x)-y arrow f(x)=y $ minden $y$-ra. 
]
#remark[
	$H$ intervallum $<=>$ bármely $s in H$ és $t in H$ esetén \ $(s;t) in H$.
]
#theorem[
	_*Weierstrass-tétel*_ szerint korlátos és zárt intervallumon értelmezett folytonos függvény felveszi a maximumát és a minimumát.
]
#proof[
	Egy zárt intervallumon folytonos függvény korlátos#footnote[Lemma, indirekten bizonyítható], tehát van szuprémuma is infinimuma. Ha $ sup f = M ==> M-1/n < f(x_n)<=M quad x_n in [a;b] $
$x_n$ sorozat korlátos (mivel $a$ és $b$ közé esik minden eleme). Korlátos sorozatnak van konvergens részsorozata. $x_n_k arrow c in [a;b]$

$ M-1/n <= f(x_n_k) <= M $
$ M <= lim_(x_n_k arrow oo) f(x_n_k) <= M $
$ f(c) = M $
Minimum belátása triviális.
]
#remark[
	HF megoldás (ha egy függvény felvesz minden értéket egy nyitott intervalllumon, akkor nem feltétlenül folytonos rajta):
	$
	f(x) = cases(
		1/((1+e^(-x))) "ha" x in RR without {0;1},
		1/(1+e) "ha" x=0,
		1/2 "ha" x=1
	)

	$
]
#definition[
	Azt mondjuk, hogy az $f$ függvény egyenletesen folytonos a $H in cal(D)_f$ halmazon, ha $forall epsilon>0$ esetén $exists delta(epsilon)>0$:
	$
	|f(x_1)-f(x_2)|<epsilon "ha" |x_1-x_2|<delta(epsilon) quad forall x_1, x_2 in H
	$
]
#theorem[
	Ha az $f$ függvény folytonos az $[a;b]$ zárt intervallumon, akkor ott egyenletesen folytonos. 
]

= Differenciálszámítás

#definition[
	Legyen $f: I subset RR arrow RR $, $a in I$ és $a$ kis környezetében is értelmezett $f$. $f$ differenciahányadosa:
	$
	(Delta f)/(Delta x) = (f(x)-f(a))/(x-a)
	$
	Ha létezik és véges $a$:
	$
	lim_(x arrow a) (f(x)-f(a))/(x-a)
	$
	Lesz $f$ függvény $a$ pontbeli differenciálhányadosa, azaz deriváltja.
]

#proposition[
	Az érintő egyenlete $a$ pontban:
	$ y = f'(a)(x-a)+f(a) $
	A normális egyenlete $a$ pontban:
	$ y = -1/(f'(a)) (x-a)+f(a) $
]

#definition[
	Az $f$ függvény differenciálható $a$ pontban, ha \ $exists A in RR$ és $epsilon: RR arrow RR$ úgy, hogy $lim_(x arrow a) epsilon(x) =0$ és $ f(x)-f(a) = A(x-a)+ epsilon(x)(x-a) $
]
#proposition[
	Ha egy $f$ függvény differenciálható, akkor folytonos.
]
#proof[
	Ha $f$ folytonos, akkor $|f(x)-f(a)|$ tetszőlegesen kicsivé tehető.
	$
	|f(x)-f(a)| = underbrace((|f(x)-f(a)|)/(x-a), f'(x) "valós szám") dot underbrace(x-a, "teszőlegesen kicsi")
	$
]
#definition[
	$f$ differenciálható $(a;b)$ intervallumon, ha differenciálható minden $x in (a;b)$ pontban. 	$f$ differenciálható $(a;b)$ intervallumon, ha differenciálható minden $x in (a;b)$ pontban és jobboldalról $a$-ban és balról $b$-ben.
]

#definition[
	$f(x)$ _*deriváltfüggvénye*_ $f'(x)$ az a függvény, melynek értelmezési tartománya $f$ differenciálható pontjai, értelmezési tartománya $f$ deriváltjai, és minden ponthoz $f$ abban a pontban vett differenciálhányadosát rendeli.
]
Deriválás jelölése:

$ dot(f)(x) = f'(x) = f^((1))(x) = dif/(dif x) f(x) $

#proposition[
	A deriválás szabályai a következők adott differenciálható $x_0$-ban $f(x): I subset RR arrow RR$, $g(x): I subset RR arrow RR$ és $lambda in RR$ esetén.
	+ $lambda f$ differenciálható $x_0$-ban és értéke $lambda f'(x_0)$
	+ $f+g$ differenciálható $x_0$-ban és értéke $(f'+g')(x_0)$
	+ $f dot g$ differenciálható $x_0$-ban és értéke $(f' dot g + f dot g')(x)$
	+ $f/g$ $quad g(x_0) !=0$ esetén differenciálható $x_0$-ban és értéke \ $((f' dot g)(x_0)-(f dot g')(x_0))/(g(x_0)^2)$
]

#proposition[
	A _*lánc-szabály*_ szerint ha $f,g$ függvények differenciálhatók$x_0$-ban és $g(x_0) in cal(D)_f$, akkor $(f circle g)$ differenciálható $x_0$-ban és értéke
	$ (f' circle g)(x) dot g'(x) $
]

== Nevezetes deriváltak
- $f(x) = x^n quad n in NN$ esetén $f'(x) = n x^(n-1)$
- $f(x) = x^alpha quad alpha in RR, x>0$ esetén $f'(x) = alpha x^(alpha-1)$
- $f(x) = sin x quad f'(x)=cos x $
- $f(x) = cos x quad f'(x)=-sin x $
#remark[
	Bizonyítsd!
]
#proposition[
Legyen $f$ szig. mon és folytonos az $x_0$ pontban és annak egy környezetében, továbbá $f(x_0)=y_0$ és $f'(x_0) !=0$. Ekkor $f^(-1)$ is differenciálható $x_0$-ban, és $f^(-1)(y_0) = 1/(f'(x_0))$
]
#proof[
	$ v=f(u) $
	$
	(f^(-1)(y_0))' = lim_(v arrow y_0) (f(v)-f(y_0))/(v-y_0) = lim_(u arrow x_0) (u-x_0)/(f(u)-f(x_0)) = 1/(f'(x_0))
	$
]
#remark[
	$ lim_(x arrow - oo) (1+1/x)^x = e $
]
== Középérték-tételek

#theorem[
	_*Rolle-féle középérték-tétel*_ szerint legyen $f:[a;b] arrow RR$ folytonos $[a;b]$-n és differenciálható $(a;b)$-ban, továbbá $f(a)=f(b)=0$. Ekkor $exists psi in (a;b)$, hogy $f'(psi) = 0$
]
#proof[
	Ha az $f(x)=0 quad forall x in I$ akkor triviális.
	Többi eset: Weierstrass-tétel szerin felveszi a minimumát és maximumát is, ahol $f'(psi) = 0$. Valamiért ezután még folytatódik a bizonyítás, de ez is elég szerintem.
]
#remark[
	$eta$ minimumra bizonyítsd.
]
#theorem[
	_*Lagrange-féle középérték-tétel*_ szerint $f: I subset.eq RR arrow RR $ $[a;b]$ intervallumon folytonos és $(a;b)$ intervallumon differenciálható függvény esetén létezik olyan $delta in (a;b)$, hogy:	$
	f'(delta) = (f(b)-f(a))/(b-a)
	$
]

#theorem[
	Ha $f$ folytonos $[a;b]$ intervallumon és differenciálható $(a;b)$ intervallumon, továbbá $forall x in (a;b)$ esetén $f'(x) = 0$, akkor $f(x) = c$ (a függvény konstans).
]

#theorem[
	_*Cauchy-féle középérték-tétel*_
]
#pagebreak()
#theorem[
	_*Taylor-sorozat*_: $f: [a;b] arrow RR, n in NN and f^(n)$ folytnos $[a;b]$-n és differenciálható $(a;b)$-n, akkor $forall x, alpha in (a;b)$ esetén $exists psi$ $x$ és $alpha$ között úgy, hogy  
	$
	f(x) = underbrace((f^(n+1)(xi))/(n+1)! (x-alpha)^(n+1),R_n "Lagrange-alakja")  + sum^n_(k=0) (f^(k)(alpha))/k! (x-alpha)^k 
	$
]
#proof[
	Legyen $x>alpha$ (arbitrárisan), és fogadjuk el hogy $0^0=1$
	$
	F(x) := f(x)-T_n (x) = f(x)-sum^n_(k=0) (f^(k)(alpha))/k! (x-alpha)^k 
	$
	$
	G(x) := (x-alpha)^(n+1)
	$
	$
	F'(x) = f'(x)- sum^n_(k=0) (f^(k)(alpha))/k! k(x-alpha)^(k-1) = f'(x)- sum^n_(k=0) (f^(k)(alpha))/(k-1)! (x-alpha)^(k-1) =
	$
	$
	=f'(x)- sum^(n-1)_(l=0) (f^(l+1)(alpha))/l! (x-alpha)^(l)
	$
	$
	F''(x) = f''(x)- sum^n_(k=0) (f^(l)(alpha))/(l-1)! (x-alpha)^(l-1) = ...
	$
	$
	F^(n) (x) = f^(n) (x)- sum^(n-n)_(j=0) (f^(j+n) (alpha))/(j!) (x-alpha)^j = f^(n) (x) - f^(n) (alpha)
	$
	$
	G'(x) = (n+1)(x-alpha)^n \
	G''(x) = n(n+1)(x-alpha)^(n-1)\
	G^n (x) = (n+1)! (x-alpha)\
	G^(n+1) (x) = (n+1)!\
	G^k (x)
	$
	Belátható, hogy
	$F(alpha) = 0$.
	És továbbá:
	$
	F^(n) (alpha) = 0 "és minden " k<n k in NN "esetén is"\
	F^(n+1) (alpha) = f^(n+1) (alpha)
	$
	És $G(x)$ is ugyanígy viselkedik.
	$
	G^(n+1) (x) = (n+1)!
	$
	Vizsgáljuk meg  $F(x)/G(x) $ hányadost:
	$
	F(x)/G(x) = (F(x)-F(alpha))/(G(x)-G(alpha))
	$
	A Cauchy-féle középérték-tétel szerint:
	$
	(F(x)-F(alpha))/(G(x)-G(alpha)) = (F'(xi_1))/(G'(xi_1))  =(F'(xi_1)-F'(alpha))/(G'(xi_1)-G'(alpha))  = (F''(xi_2))/(G''(xi_2))

	$
	És így tovább $n+1$-edik deriváltig.
	$
	... = (F^(n+1)(xi_(n+1)))/(G^(n+1) (xi_(n+1))) = (f^(n+1) (xi_n+1))/(n+1)!\
	(F(x))/(G(x)) = (f^(n+1) (xi_(n+1)))/(n+1)! ==> F(x) = (f^(n+1) (xi_(n+1)))/(n+1)! G(x) = underbrace((f^(n+1) (xi_(n+1)))/(n+1)! (x-alpha)^(n+1),R_n)
	$
	$
	F(x) = R_n ==> R_n = f(x)-T_n (x) ==> f(x) = T_n (x) + R_n
	\
	qed
	$

]

#proposition[
	Legyen $f: [a;b] arrow RR$ differenciáható $a,b$-ben (jobbról $a$-ban, balról $b$-ben). Ha $f'(b)>0$, akkor $b$-ben lokális maximuma van, ha $f'(b)<0$, akkor lokális minimuma van. $a$ esetén fordítva5. 
]
#proof[
	$
	f'(b)>0
	$
	$
	lim_(t arrow b-0) (f(t)-f(b))/(t-b) arrow f(t)<f(b) quad forall t in N_b

	$	
]

