˛
?E:\Work\Repos\EventEase\AuthService\Configurations\JwtConfig.cs
	namespace 	
AuthService
 
. 
Configurations $
{ 
public 

class 
	JwtConfig 
{ 
public 
string 
Secret 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
string- 3
.3 4
Empty4 9
;9 :
} 
} è
FE:\Work\Repos\EventEase\AuthService\Consumers\ClientDeletedConsumer.cs
	namespace 	
AuthService
 
. 
	Consumers 
{ 
public 

class !
ClientDeletedConsumer &
:' (
	IConsumer) 2
<2 3
ClientDeleted3 @
>@ A
{ 
private		 
readonly		 
ILogger		  
<		  !
ClientDeleted		! .
>		. /
_logger		0 7
;		7 8
private

 
readonly

 
UserManager

 $
<

$ %
IdentityUser

% 1
>

1 2
_userManager

3 ?
;

? @
public !
ClientDeletedConsumer $
($ %
ILogger% ,
<, -
ClientDeleted- :
>: ;
logger< B
,B C
UserManagerD O
<O P
IdentityUserP \
>\ ]
userManager^ i
)i j
{ 	
_logger 
= 
logger 
; 
_userManager 
= 
userManager &
;& '
} 	
public 
async 
Task 
Consume !
(! "
ConsumeContext" 0
<0 1
ClientDeleted1 >
>> ?
context@ G
)G H
{ 	
var 
clientDeleted 
= 
context  '
.' (
Message( /
;/ 0
_logger 
. 
LogInformation "
(" #
$"# %
$str% ;
{; <
clientDeleted< I
.I J
IdJ L
}L M
"M N
)N O
;O P
var 
	userModel 
= 
await !
_userManager" .
.. /
FindByIdAsync/ <
(< =
clientDeleted= J
.J K
IdK M
)M N
;N O
var 
	isDeleted 
= 
await !
_userManager" .
.. /
DeleteAsync/ :
(: ;
	userModel; D
)D E
;E F
Console 
. 
	WriteLine 
( 
$"  
$str  2
{2 3
clientDeleted3 @
.@ A
IdA C
}C D
$strD N
{N O
	isDeletedO X
}X Y
"Y Z
)Z [
;[ \
} 	
} 
} Ñ
EE:\Work\Repos\EventEase\AuthService\Consumers\VenueDeletedConsumer.cs
	namespace 	
AuthService
 
. 
	Consumers 
{ 
public 

class  
VenueDeletedConsumer %
:& '
	IConsumer( 1
<1 2
VenueDeleted2 >
>> ?
{		 
private

 
readonly

 
ILogger

  
<

  !
VenueDeleted

! -
>

- .
_logger

/ 6
;

6 7
private 
readonly 
UserManager $
<$ %
IdentityUser% 1
>1 2
_userManager3 ?
;? @
public  
VenueDeletedConsumer #
(# $
ILogger$ +
<+ ,
VenueDeleted, 8
>8 9
logger: @
,@ A
UserManagerB M
<M N
IdentityUserN Z
>Z [
userManager\ g
)g h
{ 	
_logger 
= 
logger 
; 
_userManager 
= 
userManager &
;& '
} 	
public 
async 
Task 
Consume !
(! "
ConsumeContext" 0
<0 1
VenueDeleted1 =
>= >
context? F
)F G
{ 	
var 
venueDeleted 
= 
context &
.& '
Message' .
;. /
_logger 
. 
LogInformation "
(" #
$"# %
$str% ;
{; <
venueDeleted< H
.H I
IdI K
}K L
"L M
)M N
;N O
var 
	userModel 
= 
await !
_userManager" .
.. /
FindByIdAsync/ <
(< =
venueDeleted= I
.I J
IdJ L
)L M
;M N
var 
	isDeleted 
= 
await !
_userManager" .
.. /
DeleteAsync/ :
(: ;
	userModel; D
)D E
;E F
Console 
. 
	WriteLine 
( 
$"  
$str  1
{1 2
venueDeleted2 >
.> ?
Id? A
}A B
$strB L
{L M
	isDeletedM V
}V W
"W X
)X Y
;Y Z
} 	
} 
}   ∫^
AE:\Work\Repos\EventEase\AuthService\Controllers\AuthController.cs
	namespace 	
AuthService
 
. 
Controllers !
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
AuthController 
:  !
ControllerBase" 0
{ 
private 
readonly 
ILogger  
<  !
AuthController! /
>/ 0
_logger1 8
;8 9
private 
readonly 
UserManager $
<$ %
IdentityUser% 1
>1 2
_userManager3 ?
;? @
private 
readonly 
RoleManager $
<$ %
IdentityRole% 1
>1 2
_roleManager3 ?
;? @
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
	JwtConfig "

_jwtConfig# -
;- .
private 
readonly 
IPublishEndpoint )
_publishEndpoint* :
;: ;
public 
AuthController 
( 
ILogger %
<% &
AuthController& 4
>4 5
logger6 <
,< =
UserManager 
< 
IdentityUser $
>$ %
userManager& 1
,1 2
RoleManager 
< 
IdentityRole $
>$ %
roleManager& 1
,1 2
IOptionsMonitor 
< 
	JwtConfig %
>% &
optionsMonitor' 5
,5 6
IMapper 
mapper 
, 
IPublishEndpoint 
publishEndpoint ,
), -
{ 	
_logger 
= 
logger 
; 
_userManager   
=   
userManager   &
;  & '

_jwtConfig!! 
=!! 
optionsMonitor!! '
.!!' (
CurrentValue!!( 4
;!!4 5
_roleManager"" 
="" 
roleManager"" &
;""& '
_mapper## 
=## 
mapper## 
;## 
_publishEndpoint$$ 
=$$ 
publishEndpoint$$ .
;$$. /
}%% 	
[,, 	
HttpPost,,	 
],, 
[-- 	
Route--	 
(-- 
$str-- 
)-- 
]-- 
public.. 
async.. 
Task.. 
<.. 
IActionResult.. '
>..' (
Login..) .
(... /
[../ 0
FromBody..0 8
]..8 9
LoginDto..: B
loginDto..C K
)..K L
{// 	
if00 
(00 

ModelState00 
.00 
IsValid00 !
)00! "
{00" #
var11 
user11 
=11 
await11  
_userManager11! -
.11- .
FindByEmailAsync11. >
(11> ?
loginDto11? G
.11G H
Email11H M
)11M N
;11N O
if33 
(33 
user33 
==33 
null33 
)33  
{33  !
return44 

BadRequest44 %
(44% &
$str44& >
)44> ?
;44? @
}55 
var77 
isPasswordValid77 #
=77$ %
await77& +
_userManager77, 8
.778 9
CheckPasswordAsync779 K
(77K L
user77L P
,77P Q
loginDto77R Z
.77Z [
Password77[ c
)77c d
;77d e
if99 
(99 
isPasswordValid99 "
)99" #
{:: 
var;; 

userClaims;; "
=;;# $
await;;% *
_userManager;;+ 7
.;;7 8
GetClaimsAsync;;8 F
(;;F G
user;;G K
);;K L
;;;L M
var<< 
	userRoles<< !
=<<" #
await<<$ )
_userManager<<* 6
.<<6 7
GetRolesAsync<<7 D
(<<D E
user<<E I
)<<I J
;<<J K
var>> 
token>> 
=>> 
await>>  %
	JWTHelper>>& /
.>>/ 0
GenerateJwtToken>>0 @
(>>@ A
user>>A E
,>>E F

_jwtConfig>>G Q
,>>Q R

userClaims>>S ]
,>>] ^
	userRoles>>_ h
)>>h i
;>>i j
return@@ 
Ok@@ 
(@@ 
new@@ !
UserLoginResDto@@" 1
(@@1 2
)@@2 3
{AA 
TokenBB 
=BB 
tokenBB  %
,BB% &
ResultCC 
=CC  
trueCC! %
}DD 
)DD 
;DD 
}EE 
returnGG 

BadRequestGG !
(GG! "
$strGG" :
)GG: ;
;GG; <
}HH 
returnJJ 

BadRequestJJ 
(JJ 
$strJJ 7
)JJ7 8
;JJ8 9
}KK 	
[MM 	
HttpPostMM	 
]MM 
[NN 	
RouteNN	 
(NN 
$strNN 
)NN 
]NN 
publicOO 
asyncOO 
TaskOO 
<OO 
IActionResultOO '
>OO' (
RegisterOO) 1
(OO1 2
[OO2 3
FromBodyOO3 ;
]OO; <
UserRegisterDtoOO= L
registerDtoOOM X
)OOX Y
{PP 	
ifQQ 
(QQ 

ModelStateQQ 
.QQ 
IsValidQQ !
)QQ! "
{RR 
varSS 
userSS 
=SS 
newSS 
IdentityUserSS +
(SS+ ,
)SS, -
{TT 
EmailUU 
=UU 
registerDtoUU '
.UU' (
EmailUU( -
,UU- .
UserNameVV 
=VV 
registerDtoVV *
.VV* +
EmailVV+ 0
}WW 
;WW 
varZZ 

roleExistsZZ 
=ZZ  
awaitZZ! &
_roleManagerZZ' 3
.ZZ3 4
RoleExistsAsyncZZ4 C
(ZZC D
registerDtoZZD O
.ZZO P
RoleZZP T
)ZZT U
;ZZU V
if[[ 
([[ 
![[ 

roleExists[[ 
)[[  
{\\ 
_logger]] 
.]] 
LogInformation]] *
(]]* +
$"]]+ -
$str]]- 8
{]]8 9
registerDto]]9 D
.]]D E
Role]]E I
}]]I J
$str]]J Z
"]]Z [
)]][ \
;]]\ ]
return^^ 

BadRequest^^ %
(^^% &
$"^^& (
$str^^( 3
{^^3 4
registerDto^^4 ?
.^^? @
Role^^@ D
}^^D E
$str^^E U
"^^U V
)^^V W
;^^W X
}__ 
varaa 
	isCreatedaa 
=aa 
awaitaa  %
_userManageraa& 2
.aa2 3
CreateAsyncaa3 >
(aa> ?
useraa? C
,aaC D
registerDtoaaE P
.aaP Q
PasswordaaQ Y
)aaY Z
;aaZ [
ifcc 
(cc 
	isCreatedcc 
.cc 
	Succeededcc &
)cc& '
{dd 
varff 
resultff 
=ff  
awaitff! &
_userManagerff' 3
.ff3 4
AddToRoleAsyncff4 B
(ffB C
userffC G
,ffG H
registerDtoffI T
.ffT U
RoleffU Y
)ffY Z
;ffZ [
ifhh 
(hh 
resulthh 
.hh 
	Succeededhh (
)hh( )
{ii 
_loggerjj 
.jj  
LogInformationjj  .
(jj. /
$"jj/ 1
$strjj1 n
{jjn o
userjjo s
.jjs t
Emailjjt y
}jjy z
$strjjz {
"jj{ |
)jj| }
;jj} ~
}kk 
ifoo 
(oo 
registerDtooo "
.oo" #
Roleoo# '
==oo( *
$stroo+ 3
)oo3 4
{pp 
varqq 
clientCreatedqq )
=qq* +
newqq, /
ClientCreatedqq0 =
(qq= >
)qq> ?
{rr 
Idss 
=ss  
userss! %
.ss% &
Idss& (
,ss( )
Namett  
=tt! "
registerDtott# .
.tt. /
Namett/ 3
,tt3 4
Emailuu !
=uu" #
useruu$ (
.uu( )
Emailuu) .
,uu. /
}vv 
;vv 
Consoleww 
.ww  
	WriteLineww  )
(ww) *
$"ww* ,
$strww, N
{wwN O
clientCreatedwwO \
.ww\ ]
Idww] _
}ww_ `
"ww` a
)wwa b
;wwb c
awaitxx 
_publishEndpointxx .
.xx. /
Publishxx/ 6
<xx6 7
ClientCreatedxx7 D
>xxD E
(xxE F
clientCreatedxxF S
)xxS T
;xxT U
}yy 
elsezz 
ifzz 
(zz 
registerDtozz '
.zz' (
Rolezz( ,
==zz- /
$strzz0 7
)zz7 8
{{{ 
var|| 
venueCreated|| (
=||) *
new||+ .
VenueCreated||/ ;
(||; <
)||< =
{}} 
Id~~ 
=~~  
user~~! %
.~~% &
Id~~& (
,~~( )
Name  
=! "
registerDto# .
.. /
Name/ 3
,3 4
Email
ÄÄ !
=
ÄÄ" #
user
ÄÄ$ (
.
ÄÄ( )
Email
ÄÄ) .
,
ÄÄ. /
}
ÅÅ 
;
ÅÅ 
Console
ÇÇ 
.
ÇÇ  
	WriteLine
ÇÇ  )
(
ÇÇ) *
$"
ÇÇ* ,
$str
ÇÇ, N
{
ÇÇN O
venueCreated
ÇÇO [
.
ÇÇ[ \
Id
ÇÇ\ ^
}
ÇÇ^ _
"
ÇÇ_ `
)
ÇÇ` a
;
ÇÇa b
await
ÉÉ 
_publishEndpoint
ÉÉ .
.
ÉÉ. /
Publish
ÉÉ/ 6
<
ÉÉ6 7
VenueCreated
ÉÉ7 C
>
ÉÉC D
(
ÉÉD E
venueCreated
ÉÉE Q
)
ÉÉQ R
;
ÉÉR S
}
ÑÑ 
var
áá 

userClaims
áá "
=
áá# $
await
áá% *
_userManager
áá+ 7
.
áá7 8
GetClaimsAsync
áá8 F
(
ááF G
user
ááG K
)
ááK L
;
ááL M
var
àà 
	userRoles
àà !
=
àà" #
await
àà$ )
_userManager
àà* 6
.
àà6 7
GetRolesAsync
àà7 D
(
ààD E
user
ààE I
)
ààI J
;
ààJ K
var
ää 
token
ää 
=
ää 
await
ää  %
	JWTHelper
ää& /
.
ää/ 0
GenerateJwtToken
ää0 @
(
ää@ A
user
ääA E
,
ääE F

_jwtConfig
ääG Q
,
ääQ R

userClaims
ääS ]
,
ää] ^
	userRoles
ää_ h
)
ääh i
;
ääi j
return
ãã 
Ok
ãã 
(
ãã 
new
ãã ! 
UserRegisterResDto
ãã" 4
(
ãã4 5
)
ãã5 6
{
åå 
Result
çç 
=
çç  
true
çç! %
,
çç% &
Token
éé 
=
éé 
token
éé  %
}
èè 
)
èè 
;
èè 
}
êê 
return
íí 

BadRequest
íí !
(
íí! "
	isCreated
íí" +
.
íí+ ,
Errors
íí, 2
.
íí2 3
Select
íí3 9
(
íí9 :
x
íí: ;
=>
íí< >
x
íí? @
.
íí@ A
Description
ííA L
)
ííL M
.
ííM N
ToList
ííN T
(
ííT U
)
ííU V
)
ííV W
;
ííW X
}
ìì 
return
ïï 

BadRequest
ïï 
(
ïï 
$str
ïï 7
)
ïï7 8
;
ïï8 9
}
ññ 	
}
ôô 
}öö àm
BE:\Work\Repos\EventEase\AuthService\Controllers\RolesController.cs
	namespace 	
AuthService
 
. 
Controllers !
{		 
[

 
ApiController

 
]

 
[ 
Route 

(
 
$str "
)" #
]# $
public 

class 
RolesController  
:! "
ControllerBase# 1
{ 
private 
readonly 
AppDbContext %
_apiDbContext& 3
;3 4
private 
readonly 
UserManager $
<$ %
IdentityUser% 1
>1 2
_userManager3 ?
;? @
private 
readonly 
RoleManager $
<$ %
IdentityRole% 1
>1 2
_roleManager3 ?
;? @
private 
readonly 
ILogger  
<  !
RolesController! 0
>0 1
_logger2 9
;9 :
public 
RolesController 
( 
AppDbContext +
apiDbContext, 8
,8 9
UserManager: E
<E F
IdentityUserF R
>R S
userManagerT _
,_ `
RoleManagera l
<l m
IdentityRolem y
>y z
roleManager	{ Ü
,
Ü á
ILogger
à è
<
è ê
RolesController
ê ü
>
ü †
logger
° ß
)
ß ®
{ 	
_apiDbContext 
= 
apiDbContext (
;( )
_userManager 
= 
userManager &
;& '
_roleManager 
= 
roleManager &
;& '
_logger 
= 
logger 
; 
} 	
[ 	
HttpGet	 
] 
public 
IActionResult 
GetAllRoles (
(( )
)) *
{ 	
var 
roles 
= 
_roleManager $
.$ %
Roles% *
.* +
ToList+ 1
(1 2
)2 3
;3 4
return 
Ok 
( 
roles 
) 
; 
}   	
["" 	
HttpPost""	 
]"" 
[## 	
	Authorize##	 
(## !
AuthenticationSchemes## (
=##) *
JwtBearerDefaults##+ <
.##< = 
AuthenticationScheme##= Q
,##Q R
Roles##S X
=##Y Z
$str##[ b
)##b c
]##c d
public$$ 
async$$ 
Task$$ 
<$$ 
IActionResult$$ '
>$$' (

CreateRole$$) 3
($$3 4
RoleCreateDto$$4 A
roleCreateDto$$B O
)$$O P
{%% 	
var'' 

roleExists'' 
='' 
await'' "
_roleManager''# /
.''/ 0
RoleExistsAsync''0 ?
(''? @
roleCreateDto''@ M
.''M N
Name''N R
)''R S
;''S T
if** 
(** 

roleExists** 
)** 
{++ 
return,, 
Conflict,, 
(,,  
$",,  "
$str,," -
{,,- .
roleCreateDto,,. ;
.,,; <
Name,,< @
},,@ A
$str,,A Q
",,Q R
),,R S
;,,S T
}-- 
var// 

roleResult// 
=// 
await// "
_roleManager//# /
./// 0
CreateAsync//0 ;
(//; <
new//< ?
IdentityRole//@ L
(//L M
roleCreateDto//M Z
.//Z [
Name//[ _
)//_ `
)//` a
;//a b
if11 
(11 

roleResult11 
.11 
	Succeeded11 $
)11$ %
{22 
_logger33 
.33 
LogInformation33 &
(33& '
$"33' )
$str33) 8
{338 9
roleCreateDto339 F
.33F G
Name33G K
}33K L
$str33L ^
"33^ _
)33_ `
;33` a
return44 
Ok44 
(44 
$"44 
$str44 +
{44+ ,
roleCreateDto44, 9
.449 :
Name44: >
}44> ?
$str44? R
"44R S
)44S T
;44T U
}55 
_logger66 
.66 
LogInformation66 "
(66" #
$"66# %
$str66% 4
{664 5
roleCreateDto665 B
.66B C
Name66C G
}66G H
$str66H ^
"66^ _
)66_ `
;66` a
return77 

BadRequest77 
(77 
$"77  
$str77  /
{77/ 0
roleCreateDto770 =
.77= >
Name77> B
}77B C
$str77C Y
"77Y Z
)77Z [
;77[ \
}88 	
[:: 	
HttpPost::	 
]:: 
[;; 	
Route;;	 
(;; 
$str;; !
);;! "
];;" #
[<< 	
	Authorize<<	 
(<< !
AuthenticationSchemes<< (
=<<) *
JwtBearerDefaults<<+ <
.<<< = 
AuthenticationScheme<<= Q
,<<Q R
Roles<<S X
=<<Y Z
$str<<[ b
)<<b c
]<<c d
public== 
async== 
Task== 
<== 
IActionResult== '
>==' (
AssignRoleToUser==) 9
(==9 :
UserRoleDto==: E
userRoleDto==F Q
)==Q R
{>> 	
var@@ 
user@@ 
=@@ 
await@@ 
_userManager@@ )
.@@) *
FindByEmailAsync@@* :
(@@: ;
userRoleDto@@; F
.@@F G
Email@@G L
)@@L M
;@@M N
ifAA 
(AA 
userAA 
isAA 
nullAA 
)AA 
{BB 
_loggerCC 
.CC 
LogInformationCC &
(CC& '
$"CC' )
$strCC) :
{CC: ;
userRoleDtoCC; F
.CCF G
EmailCCG L
}CCL M
$strCCM ]
"CC] ^
)CC^ _
;CC_ `
returnDD 

BadRequestDD !
(DD! "
$strDD" 7
)DD7 8
;DD8 9
}EE 
varHH 

roleExistsHH 
=HH 
awaitHH "
_roleManagerHH# /
.HH/ 0
RoleExistsAsyncHH0 ?
(HH? @
userRoleDtoHH@ K
.HHK L
RoleHHL P
)HHP Q
;HHQ R
ifII 
(II 
!II 

roleExistsII 
)II 
{JJ 
_loggerKK 
.KK 
LogInformationKK &
(KK& '
$"KK' )
$strKK) 4
{KK4 5
userRoleDtoKK5 @
.KK@ A
RoleKKA E
}KKE F
$strKKF V
"KKV W
)KKW X
;KKX Y
returnLL 

BadRequestLL !
(LL! "
$"LL" $
$strLL$ /
{LL/ 0
userRoleDtoLL0 ;
.LL; <
RoleLL< @
}LL@ A
$strLLA Q
"LLQ R
)LLR S
;LLS T
}MM 
varPP 
resultPP 
=PP 
awaitPP 
_userManagerPP +
.PP+ ,
AddToRoleAsyncPP, :
(PP: ;
userPP; ?
,PP? @
userRoleDtoPPA L
.PPL M
RolePPM Q
)PPQ R
;PPR S
ifSS 
(SS 
resultSS 
.SS 
	SucceededSS  
)SS  !
{TT 
_loggerUU 
.UU 
LogInformationUU &
(UU& '
$"UU' )
$strUU) f
{UUf g
userUUg k
.UUk l
EmailUUl q
}UUq r
$strUUr s
"UUs t
)UUt u
;UUu v
returnVV 
OkVV 
(VV 
$"VV 
$strVV Y
{VVY Z
userVVZ ^
.VV^ _
EmailVV_ d
}VVd e
$strVVe f
"VVf g
)VVg h
;VVh i
}WW 
_loggerYY 
.YY 
LogInformationYY "
(YY" #
$"YY# %
$strYY% T
{YYT U
userYYU Y
.YYY Z
EmailYYZ _
}YY_ `
$strYY` a
"YYa b
)YYb c
;YYc d
returnZZ 

BadRequestZZ 
(ZZ 
$"ZZ  
$strZZ  O
{ZZO P
userZZP T
.ZZT U
EmailZZU Z
}ZZZ [
$strZZ[ \
"ZZ\ ]
)ZZ] ^
;ZZ^ _
}[[ 	
[]] 	
HttpGet]]	 
]]] 
[^^ 	
Route^^	 
(^^ 
$str^^ 
)^^ 
]^^ 
[__ 	
	Authorize__	 
(__ !
AuthenticationSchemes__ (
=__) *
JwtBearerDefaults__+ <
.__< = 
AuthenticationScheme__= Q
,__Q R
Roles__S X
=__Y Z
$str__[ b
)__b c
]__c d
public`` 
async`` 
Task`` 
<`` 
IActionResult`` '
>``' (
GetUserRoles``) 5
(``5 6
string``6 <
email``= B
)``B C
{aa 	
varcc 
usercc 
=cc 
awaitcc 
_userManagercc )
.cc) *
FindByEmailAsynccc* :
(cc: ;
emailcc; @
)cc@ A
;ccA B
ifee 
(ee 
useree 
isee 
nullee 
)ee 
{ff 
_loggergg 
.gg 
LogInformationgg &
(gg& '
$"gg' )
$strgg) :
{gg: ;
emailgg; @
}gg@ A
$strggA Q
"ggQ R
)ggR S
;ggS T
returnhh 

BadRequesthh !
(hh! "
$strhh" 7
)hh7 8
;hh8 9
}ii 
varll 
rolesll 
=ll 
awaitll 
_userManagerll *
.ll* +
GetRolesAsyncll+ 8
(ll8 9
userll9 =
)ll= >
;ll> ?
returnnn 
Oknn 
(nn 
rolesnn 
)nn 
;nn 
}oo 	
[qq 	
HttpPostqq	 
]qq 
[rr 	
Routerr	 
(rr 
$strrr !
)rr! "
]rr" #
[ss 	
	Authorizess	 
(ss !
AuthenticationSchemesss (
=ss) *
JwtBearerDefaultsss+ <
.ss< = 
AuthenticationSchemess= Q
,ssQ R
RolesssS X
=ssY Z
$strss[ b
)ssb c
]ssc d
publictt 
asynctt 
Tasktt 
<tt 
IActionResulttt '
>tt' (
UnassignUserRolett) 9
(tt9 :
UserRoleDtott: E
userRoleDtottF Q
)ttQ R
{uu 	
varww 
userww 
=ww 
awaitww 
_userManagerww )
.ww) *
FindByEmailAsyncww* :
(ww: ;
userRoleDtoww; F
.wwF G
EmailwwG L
)wwL M
;wwM N
ifxx 
(xx 
userxx 
isxx 
nullxx 
)xx 
{yy 
_loggerzz 
.zz 
LogInformationzz &
(zz& '
$"zz' )
$strzz) :
{zz: ;
userRoleDtozz; F
.zzF G
EmailzzG L
}zzL M
$strzzM ]
"zz] ^
)zz^ _
;zz_ `
return{{ 

BadRequest{{ !
({{! "
$str{{" 7
){{7 8
;{{8 9
}|| 
var~~ 

roleExists~~ 
=~~ 
await~~ "
_roleManager~~# /
.~~/ 0
RoleExistsAsync~~0 ?
(~~? @
userRoleDto~~@ K
.~~K L
Role~~L P
)~~P Q
;~~Q R
if 
( 
! 

roleExists 
) 
{
ÄÄ 
_logger
ÅÅ 
.
ÅÅ 
LogInformation
ÅÅ &
(
ÅÅ& '
$"
ÅÅ' )
$str
ÅÅ) 4
{
ÅÅ4 5
userRoleDto
ÅÅ5 @
.
ÅÅ@ A
Role
ÅÅA E
}
ÅÅE F
$str
ÅÅF V
"
ÅÅV W
)
ÅÅW X
;
ÅÅX Y
return
ÇÇ 

BadRequest
ÇÇ !
(
ÇÇ! "
$"
ÇÇ" $
$str
ÇÇ$ /
{
ÇÇ/ 0
userRoleDto
ÇÇ0 ;
.
ÇÇ; <
Role
ÇÇ< @
}
ÇÇ@ A
$str
ÇÇA Q
"
ÇÇQ R
)
ÇÇR S
;
ÇÇS T
}
ÉÉ 
var
ÖÖ 
result
ÖÖ 
=
ÖÖ 
await
ÖÖ 
_userManager
ÖÖ +
.
ÖÖ+ ,!
RemoveFromRoleAsync
ÖÖ, ?
(
ÖÖ? @
user
ÖÖ@ D
,
ÖÖD E
userRoleDto
ÖÖF Q
.
ÖÖQ R
Role
ÖÖR V
)
ÖÖV W
;
ÖÖW X
if
áá 
(
áá 
result
áá 
.
áá 
	Succeeded
áá  
)
áá  !
{
àà 
return
ââ 
Ok
ââ 
(
ââ 
$"
ââ 
$str
ââ "
{
ââ" #
userRoleDto
ââ# .
.
ââ. /
Role
ââ/ 3
}
ââ3 4
$str
ââ4 ]
{
ââ] ^
user
ââ^ b
.
ââb c
Email
ââc h
}
ââh i
$str
ââi j
"
ââj k
)
ââk l
;
ââl m
}
ää 
return
åå 

BadRequest
åå 
(
åå 
$"
åå  
$str
åå  7
{
åå7 8
userRoleDto
åå8 C
.
ååC D
Role
ååD H
}
ååH I
$str
ååI a
{
ååa b
user
ååb f
.
ååf g
Email
ååg l
}
åål m
$str
ååm n
"
åån o
)
ååo p
;
ååp q
}
çç 	
}
éé 
}èè Ÿ
8E:\Work\Repos\EventEase\AuthService\Data\AppDbContext.cs
	namespace 	
AuthService
 
. 
Data 
{ 
public 

class 
AppDbContext 
: 
IdentityDbContext  1
{ 
public 
AppDbContext 
( 
DbContextOptions ,
<, -
AppDbContext- 9
>9 :
options; B
)B C
:		 
base		 
(		 
options		 
)		 
{

 	
} 	
} 
} ˇ6
4E:\Work\Repos\EventEase\AuthService\Data\PrepData.cs
	namespace 	
AuthService
 
. 
Data 
{ 
public 

class 
PrepData 
{ 
public		 
static		 
async		 
void		  
PrepPopulation		! /
(		/ 0
IApplicationBuilder		0 C
app		D G
,		G H
bool		I M
isProd		N T
)		T U
{

 	
using 
( 
var 
serviceScope #
=$ %
app& )
.) *
ApplicationServices* =
.= >
CreateScope> I
(I J
)J K
)K L
{ 
await 
SeedData 
( 
serviceScope +
.+ ,
ServiceProvider, ;
.; <

GetService< F
<F G
AppDbContextG S
>S T
(T U
)U V
,V W
serviceScopeX d
.d e
ServiceProvidere t
.t u

GetServiceu 
<	 Ä
UserManager
Ä ã
<
ã å
IdentityUser
å ò
>
ò ô
>
ô ö
(
ö õ
)
õ ú
,
ú ù
serviceScope
û ™
.
™ ´
ServiceProvider
´ ∫
.
∫ ª

GetService
ª ≈
<
≈ ∆
RoleManager
∆ —
<
— “
IdentityRole
“ ﬁ
>
ﬁ ﬂ
>
ﬂ ‡
(
‡ ·
)
· ‚
,
‚ „
isProd
‰ Í
)
Í Î
;
Î Ï
} 
} 	
private 
static 
async 
Task !
SeedData" *
(* +
AppDbContext+ 7
context8 ?
,? @
UserManagerA L
<L M
IdentityUserM Y
>Y Z
userManager[ f
,f g
RoleManagerh s
<s t
IdentityRole	t Ä
>
Ä Å
roleManager
Ç ç
,
ç é
bool
è ì
isProd
î ö
)
ö õ
{ 	
if## 
(## 
!## 
isProd## 
)## 
{## 
if&& 
(&& 
await&& 
userManager&& $
.&&$ %
Users&&% *
.&&* +
AnyAsync&&+ 3
(&&3 4
)&&4 5
)&&5 6
{'' 
Console(( 
.(( 
	WriteLine(( %
(((% &
$str((& <
)((< =
;((= >
EmptyDatabase)) !
())! "
context))" )
)))) *
;))* +
}** 
Console++ 
.++ 
	WriteLine++ !
(++! "
$str++" -
)++- .
;++. /
await.. 
roleManager.. !
...! "
CreateAsync.." -
(..- .
new... 1
IdentityRole..2 >
(..> ?
$str..? F
)..F G
)..G H
;..H I
await// 
roleManager// !
.//! "
CreateAsync//" -
(//- .
new//. 1
IdentityRole//2 >
(//> ?
$str//? F
)//F G
)//G H
;//H I
await00 
roleManager00 !
.00! "
CreateAsync00" -
(00- .
new00. 1
IdentityRole002 >
(00> ?
$str00? G
)00G H
)00H I
;00I J
var44 
admin44 
=44 
new44 
IdentityUser44  ,
(44, -
)44- .
{55 
Email77 
=77 
$str77 -
,77- .
UserName88 
=88 
$str88 0
}99 
;99 
await:: 
userManager:: !
.::! "
CreateAsync::" -
(::- .
admin::. 3
,::3 4
$str::5 @
)::@ A
;::A B
await;; 
userManager;; !
.;;! "
AddToRoleAsync;;" 0
(;;0 1
admin;;1 6
,;;6 7
$str;;8 ?
);;? @
;;;@ A
var>> 
venue>> 
=>> 
new>> 
IdentityUser>>  ,
(>>, -
)>>- .
{?? 
Id@@ 
=@@ 
$str@@ ?
,@@? @
EmailAA 
=AA 
$strAA -
,AA- .
UserNameBB 
=BB 
$strBB 0
}CC 
;CC 
awaitDD 
userManagerDD !
.DD! "
CreateAsyncDD" -
(DD- .
venueDD. 3
,DD3 4
$strDD5 @
)DD@ A
;DDA B
awaitEE 
userManagerEE !
.EE! "
AddToRoleAsyncEE" 0
(EE0 1
venueEE1 6
,EE6 7
$strEE8 ?
)EE? @
;EE@ A
varHH 
clientHH 
=HH 
newHH  
IdentityUserHH! -
(HH- .
)HH. /
{II 
IdJJ 
=JJ 
$strJJ ?
,JJ? @
EmailKK 
=KK 
$strKK .
,KK. /
UserNameLL 
=LL 
$strLL 1
}MM 
;MM 
awaitNN 
userManagerNN !
.NN! "
CreateAsyncNN" -
(NN- .
clientNN. 4
,NN4 5
$strNN6 A
)NNA B
;NNB C
awaitOO 
userManagerOO !
.OO! "
AddToRoleAsyncOO" 0
(OO0 1
clientOO1 7
,OO7 8
$strOO9 A
)OOA B
;OOB C
}PP 
}QQ 	
privateSS 
staticSS 
voidSS 
EmptyDatabaseSS )
(SS) *
AppDbContextSS* 6
contextSS7 >
)SS> ?
{TT 	
varUU 
userRecordsUU 
=UU 
contextUU %
.UU% &
UsersUU& +
.UU+ ,
ToListUU, 2
(UU2 3
)UU3 4
;UU4 5
varVV 
roleRecordsVV 
=VV 
contextVV %
.VV% &
RolesVV& +
.VV+ ,
ToListVV, 2
(VV2 3
)VV3 4
;VV4 5
ifXX 
(XX 
userRecordsXX 
.XX 
CountXX !
(XX! "
)XX" #
>XX$ %
$numXX& '
)XX' (
{YY 
contextZZ 
.ZZ 
UsersZZ 
.ZZ 
RemoveRangeZZ )
(ZZ) *
userRecordsZZ* 5
)ZZ5 6
;ZZ6 7
}[[ 
if]] 
(]] 
roleRecords]] 
.]] 
Count]] !
(]]! "
)]]" #
>]]$ %
$num]]& '
)]]' (
{^^ 
context__ 
.__ 
Roles__ 
.__ 
RemoveRange__ )
(__) *
roleRecords__* 5
)__5 6
;__6 7
}`` 
contextbb 
.bb 
SaveChangesbb 
(bb  
)bb  !
;bb! "
}cc 	
}dd 
}ee –
6E:\Work\Repos\EventEase\AuthService\Dtos\AuthResult.cs
	namespace 	
AuthService
 
. 
Dtos 
{ 
public 

class 

AuthResult 
{ 
public 
string 
Token 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public 
Boolean 
Result 
{ 
get  #
;# $
set% (
;( )
}* +
public		 
List		 
<		 
string		 
>		 
Errors		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
} 
} ø
4E:\Work\Repos\EventEase\AuthService\Dtos\LoginDto.cs
	namespace 	
AuthService
 
. 
Dtos 
{ 
public 

class 
LoginDto 
{ 
[ 	
Required	 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
[		 	
Required			 
]		 
public

 
string

 
Password

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
=

- .
string

/ 5
.

5 6
Empty

6 ;
;

; <
} 
} ú
9E:\Work\Repos\EventEase\AuthService\Dtos\RoleCreateDto.cs
	namespace 	
AuthService
 
. 
Dtos 
{ 
public 

class 
RoleCreateDto 
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
} 
} Ø
;E:\Work\Repos\EventEase\AuthService\Dtos\UserLoginResDto.cs
	namespace 	
AuthService
 
. 
Dtos 
{ 
public 

class 
UserLoginResDto  
:! "

AuthResult# -
{ 
} 
} ı
;E:\Work\Repos\EventEase\AuthService\Dtos\UserRegisterDto.cs
	namespace 	
AuthService
 
. 
Dtos 
{ 
public 

class 
UserRegisterDto  
{ 
[ 	
Required	 
] 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[

 	
Required

	 
]

 
[ 	
EmailAddress	 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
] 
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
public 
string 
Role 
{ 
get  
;  !
set" %
;% &
}' (
} 
} µ
>E:\Work\Repos\EventEase\AuthService\Dtos\UserRegisterResDto.cs
	namespace 	
AuthService
 
. 
Dtos 
{ 
public 

class 
UserRegisterResDto #
:$ %

AuthResult& 0
{ 
} 
} ±
7E:\Work\Repos\EventEase\AuthService\Dtos\UserRoleDto.cs
	namespace 	
AuthService
 
. 
Dtos 
{ 
public 

class 
UserRoleDto 
{ 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Role 
{ 
get  
;  !
set" %
;% &
}' (
} 
}  '
8E:\Work\Repos\EventEase\AuthService\Helpers\JWTHelper.cs
	namespace 	
AuthService
 
. 
Helpers 
{		 
public

 

class

 
	JWTHelper

 
{ 
public 
static 
async 
Task  
<  !
string! '
>' (
GenerateJwtToken) 9
(9 :
IdentityUser: F
userG K
,K L
	JwtConfigM V
	jwtConfigW `
,` a
IListb g
<g h
Claimh m
>m n

userClaimso y
,y z
IList	{ Ä
<
Ä Å
string
Å á
>
á à
	userRoles
â í
)
í ì
{ 	
var 
jwtTokenHandler 
=  !
new" %#
JwtSecurityTokenHandler& =
(= >
)> ?
;? @
var 
key 
= 
Encoding 
. 
ASCII $
.$ %
GetBytes% -
(- .
	jwtConfig. 7
.7 8
Secret8 >
)> ?
;? @
var 
claims 
= 
await 
GetAllValidClaims 0
(0 1
user1 5
,5 6

userClaims7 A
,A B
	userRolesC L
)L M
;M N
var 
tokenDescriptor 
=  !
new" %#
SecurityTokenDescriptor& =
(= >
)> ?
{ 
Subject 
= 
new 
ClaimsIdentity ,
(, -
claims- 3
)3 4
,4 5
Expires 
= 
DateTime "
." #
Now# &
.& '
AddHours' /
(/ 0
$num0 1
)1 2
,2 3
SigningCredentials "
=# $
new% (
SigningCredentials) ;
(; <
new< ? 
SymmetricSecurityKey@ T
(T U
keyU X
)X Y
,Y Z
SecurityAlgorithms &
.& '

HmacSha512' 1
)1 2
} 
; 
var 
token 
= 
jwtTokenHandler '
.' (
CreateToken( 3
(3 4
tokenDescriptor4 C
)C D
;D E
var 
jwtToken 
= 
jwtTokenHandler *
.* +

WriteToken+ 5
(5 6
token6 ;
); <
;< =
return   
jwtToken   
;   
}!! 	
private$$ 
static$$ 
async$$ 
Task$$ !
<$$! "
List$$" &
<$$& '
Claim$$' ,
>$$, -
>$$- .
GetAllValidClaims$$/ @
($$@ A
IdentityUser$$A M
user$$N R
,$$R S
IList$$T Y
<$$Y Z
Claim$$Z _
>$$_ `

userClaims$$a k
,$$k l
IList$$m r
<$$r s
string$$s y
>$$y z
	userRoles	$${ Ñ
)
$$Ñ Ö
{%% 	
var&& 
options&& 
=&& 
new&& 
IdentityOptions&& -
(&&- .
)&&. /
;&&/ 0
var(( 
claims(( 
=(( 
new(( 
List(( !
<((! "
Claim((" '
>((' (
{)) 
new** 
Claim** 
(** 
$str** 
,** 
user**  $
.**$ %
Id**% '
)**' (
,**( )
new++ 
Claim++ 
(++ #
JwtRegisteredClaimNames++ 1
.++1 2
Sub++2 5
,++5 6
user++7 ;
.++; <
Email++< A
)++A B
,++B C
new,, 
Claim,, 
(,, #
JwtRegisteredClaimNames,, 1
.,,1 2
Email,,2 7
,,,7 8
user,,9 =
.,,= >
Email,,> C
),,C D
,,,D E
new-- 
Claim-- 
(-- #
JwtRegisteredClaimNames-- 1
.--1 2
Jti--2 5
,--5 6
Guid--7 ;
.--; <
NewGuid--< C
(--C D
)--D E
.--E F
ToString--F N
(--N O
)--O P
)--P Q
}.. 
;.. 
claims00 
.00 
AddRange00 
(00 

userClaims00 &
)00& '
;00' (
foreach33 
(33 
var33 
role33 
in33 
	userRoles33  )
)33) *
{44 
claims55 
.55 
Add55 
(55 
new55 
Claim55 $
(55$ %

ClaimTypes55% /
.55/ 0
Role550 4
,554 5
role556 :
)55: ;
)55; <
;55< =
}66 
return88 
claims88 
;88 
}99 	
}:: 
};; —≈
PE:\Work\Repos\EventEase\AuthService\Migrations\20231228205649_InitialIdentity.cs
	namespace 	
AuthService
 
. 

Migrations  
{ 
public		 

partial		 
class		 
InitialIdentity		 (
:		) *
	Migration		+ 4
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str #
,# $
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
string& ,
>, -
(- .
type. 2
:2 3
$str4 C
,C D
nullableE M
:M N
falseO T
)T U
,U V
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 E
,E F
	maxLengthG P
:P Q
$numR U
,U V
nullableW _
:_ `
truea e
)e f
,f g
NormalizedName "
=# $
table% *
.* +
Column+ 1
<1 2
string2 8
>8 9
(9 :
type: >
:> ?
$str@ O
,O P
	maxLengthQ Z
:Z [
$num\ _
,_ `
nullablea i
:i j
truek o
)o p
,p q
ConcurrencyStamp $
=% &
table' ,
., -
Column- 3
<3 4
string4 :
>: ;
(; <
type< @
:@ A
$strB Q
,Q R
nullableS [
:[ \
true] a
)a b
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 5
,5 6
x7 8
=>9 ;
x< =
.= >
Id> @
)@ A
;A B
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str #
,# $
columns 
: 
table 
=> !
new" %
{ 
Id   
=   
table   
.   
Column   %
<  % &
string  & ,
>  , -
(  - .
type  . 2
:  2 3
$str  4 C
,  C D
nullable  E M
:  M N
false  O T
)  T U
,  U V
UserName!! 
=!! 
table!! $
.!!$ %
Column!!% +
<!!+ ,
string!!, 2
>!!2 3
(!!3 4
type!!4 8
:!!8 9
$str!!: I
,!!I J
	maxLength!!K T
:!!T U
$num!!V Y
,!!Y Z
nullable!![ c
:!!c d
true!!e i
)!!i j
,!!j k
NormalizedUserName"" &
=""' (
table"") .
."". /
Column""/ 5
<""5 6
string""6 <
>""< =
(""= >
type""> B
:""B C
$str""D S
,""S T
	maxLength""U ^
:""^ _
$num""` c
,""c d
nullable""e m
:""m n
true""o s
)""s t
,""t u
Email## 
=## 
table## !
.##! "
Column##" (
<##( )
string##) /
>##/ 0
(##0 1
type##1 5
:##5 6
$str##7 F
,##F G
	maxLength##H Q
:##Q R
$num##S V
,##V W
nullable##X `
:##` a
true##b f
)##f g
,##g h
NormalizedEmail$$ #
=$$$ %
table$$& +
.$$+ ,
Column$$, 2
<$$2 3
string$$3 9
>$$9 :
($$: ;
type$$; ?
:$$? @
$str$$A P
,$$P Q
	maxLength$$R [
:$$[ \
$num$$] `
,$$` a
nullable$$b j
:$$j k
true$$l p
)$$p q
,$$q r
EmailConfirmed%% "
=%%# $
table%%% *
.%%* +
Column%%+ 1
<%%1 2
bool%%2 6
>%%6 7
(%%7 8
type%%8 <
:%%< =
$str%%> C
,%%C D
nullable%%E M
:%%M N
false%%O T
)%%T U
,%%U V
PasswordHash&&  
=&&! "
table&&# (
.&&( )
Column&&) /
<&&/ 0
string&&0 6
>&&6 7
(&&7 8
type&&8 <
:&&< =
$str&&> M
,&&M N
nullable&&O W
:&&W X
true&&Y ]
)&&] ^
,&&^ _
SecurityStamp'' !
=''" #
table''$ )
.'') *
Column''* 0
<''0 1
string''1 7
>''7 8
(''8 9
type''9 =
:''= >
$str''? N
,''N O
nullable''P X
:''X Y
true''Z ^
)''^ _
,''_ `
ConcurrencyStamp(( $
=((% &
table((' ,
.((, -
Column((- 3
<((3 4
string((4 :
>((: ;
(((; <
type((< @
:((@ A
$str((B Q
,((Q R
nullable((S [
:(([ \
true((] a
)((a b
,((b c
PhoneNumber)) 
=))  !
table))" '
.))' (
Column))( .
<)). /
string))/ 5
>))5 6
())6 7
type))7 ;
:)); <
$str))= L
,))L M
nullable))N V
:))V W
true))X \
)))\ ]
,))] ^ 
PhoneNumberConfirmed** (
=**) *
table**+ 0
.**0 1
Column**1 7
<**7 8
bool**8 <
>**< =
(**= >
type**> B
:**B C
$str**D I
,**I J
nullable**K S
:**S T
false**U Z
)**Z [
,**[ \
TwoFactorEnabled++ $
=++% &
table++' ,
.++, -
Column++- 3
<++3 4
bool++4 8
>++8 9
(++9 :
type++: >
:++> ?
$str++@ E
,++E F
nullable++G O
:++O P
false++Q V
)++V W
,++W X

LockoutEnd,, 
=,,  
table,,! &
.,,& '
Column,,' -
<,,- .
DateTimeOffset,,. <
>,,< =
(,,= >
type,,> B
:,,B C
$str,,D T
,,,T U
nullable,,V ^
:,,^ _
true,,` d
),,d e
,,,e f
LockoutEnabled-- "
=--# $
table--% *
.--* +
Column--+ 1
<--1 2
bool--2 6
>--6 7
(--7 8
type--8 <
:--< =
$str--> C
,--C D
nullable--E M
:--M N
false--O T
)--T U
,--U V
AccessFailedCount.. %
=..& '
table..( -
...- .
Column... 4
<..4 5
int..5 8
>..8 9
(..9 :
type..: >
:..> ?
$str..@ E
,..E F
nullable..G O
:..O P
false..Q V
)..V W
}// 
,// 
constraints00 
:00 
table00 "
=>00# %
{11 
table22 
.22 

PrimaryKey22 $
(22$ %
$str22% 5
,225 6
x227 8
=>229 ;
x22< =
.22= >
Id22> @
)22@ A
;22A B
}33 
)33 
;33 
migrationBuilder55 
.55 
CreateTable55 (
(55( )
name66 
:66 
$str66 (
,66( )
columns77 
:77 
table77 
=>77 !
new77" %
{88 
Id99 
=99 
table99 
.99 
Column99 %
<99% &
int99& )
>99) *
(99* +
type99+ /
:99/ 0
$str991 6
,996 7
nullable998 @
:99@ A
false99B G
)99G H
.:: 

Annotation:: #
(::# $
$str::$ 8
,::8 9
$str::: @
)::@ A
,::A B
RoleId;; 
=;; 
table;; "
.;;" #
Column;;# )
<;;) *
string;;* 0
>;;0 1
(;;1 2
type;;2 6
:;;6 7
$str;;8 G
,;;G H
nullable;;I Q
:;;Q R
false;;S X
);;X Y
,;;Y Z
	ClaimType<< 
=<< 
table<<  %
.<<% &
Column<<& ,
<<<, -
string<<- 3
><<3 4
(<<4 5
type<<5 9
:<<9 :
$str<<; J
,<<J K
nullable<<L T
:<<T U
true<<V Z
)<<Z [
,<<[ \

ClaimValue== 
===  
table==! &
.==& '
Column==' -
<==- .
string==. 4
>==4 5
(==5 6
type==6 :
:==: ;
$str==< K
,==K L
nullable==M U
:==U V
true==W [
)==[ \
}>> 
,>> 
constraints?? 
:?? 
table?? "
=>??# %
{@@ 
tableAA 
.AA 

PrimaryKeyAA $
(AA$ %
$strAA% :
,AA: ;
xAA< =
=>AA> @
xAAA B
.AAB C
IdAAC E
)AAE F
;AAF G
tableBB 
.BB 

ForeignKeyBB $
(BB$ %
nameCC 
:CC 
$strCC F
,CCF G
columnDD 
:DD 
xDD  !
=>DD" $
xDD% &
.DD& '
RoleIdDD' -
,DD- .
principalTableEE &
:EE& '
$strEE( 5
,EE5 6
principalColumnFF '
:FF' (
$strFF) -
,FF- .
onDeleteGG  
:GG  !
ReferentialActionGG" 3
.GG3 4
CascadeGG4 ;
)GG; <
;GG< =
}HH 
)HH 
;HH 
migrationBuilderJJ 
.JJ 
CreateTableJJ (
(JJ( )
nameKK 
:KK 
$strKK (
,KK( )
columnsLL 
:LL 
tableLL 
=>LL !
newLL" %
{MM 
IdNN 
=NN 
tableNN 
.NN 
ColumnNN %
<NN% &
intNN& )
>NN) *
(NN* +
typeNN+ /
:NN/ 0
$strNN1 6
,NN6 7
nullableNN8 @
:NN@ A
falseNNB G
)NNG H
.OO 

AnnotationOO #
(OO# $
$strOO$ 8
,OO8 9
$strOO: @
)OO@ A
,OOA B
UserIdPP 
=PP 
tablePP "
.PP" #
ColumnPP# )
<PP) *
stringPP* 0
>PP0 1
(PP1 2
typePP2 6
:PP6 7
$strPP8 G
,PPG H
nullablePPI Q
:PPQ R
falsePPS X
)PPX Y
,PPY Z
	ClaimTypeQQ 
=QQ 
tableQQ  %
.QQ% &
ColumnQQ& ,
<QQ, -
stringQQ- 3
>QQ3 4
(QQ4 5
typeQQ5 9
:QQ9 :
$strQQ; J
,QQJ K
nullableQQL T
:QQT U
trueQQV Z
)QQZ [
,QQ[ \

ClaimValueRR 
=RR  
tableRR! &
.RR& '
ColumnRR' -
<RR- .
stringRR. 4
>RR4 5
(RR5 6
typeRR6 :
:RR: ;
$strRR< K
,RRK L
nullableRRM U
:RRU V
trueRRW [
)RR[ \
}SS 
,SS 
constraintsTT 
:TT 
tableTT "
=>TT# %
{UU 
tableVV 
.VV 

PrimaryKeyVV $
(VV$ %
$strVV% :
,VV: ;
xVV< =
=>VV> @
xVVA B
.VVB C
IdVVC E
)VVE F
;VVF G
tableWW 
.WW 

ForeignKeyWW $
(WW$ %
nameXX 
:XX 
$strXX F
,XXF G
columnYY 
:YY 
xYY  !
=>YY" $
xYY% &
.YY& '
UserIdYY' -
,YY- .
principalTableZZ &
:ZZ& '
$strZZ( 5
,ZZ5 6
principalColumn[[ '
:[[' (
$str[[) -
,[[- .
onDelete\\  
:\\  !
ReferentialAction\\" 3
.\\3 4
Cascade\\4 ;
)\\; <
;\\< =
}]] 
)]] 
;]] 
migrationBuilder__ 
.__ 
CreateTable__ (
(__( )
name`` 
:`` 
$str`` (
,``( )
columnsaa 
:aa 
tableaa 
=>aa !
newaa" %
{bb 
LoginProvidercc !
=cc" #
tablecc$ )
.cc) *
Columncc* 0
<cc0 1
stringcc1 7
>cc7 8
(cc8 9
typecc9 =
:cc= >
$strcc? N
,ccN O
nullableccP X
:ccX Y
falseccZ _
)cc_ `
,cc` a
ProviderKeydd 
=dd  !
tabledd" '
.dd' (
Columndd( .
<dd. /
stringdd/ 5
>dd5 6
(dd6 7
typedd7 ;
:dd; <
$strdd= L
,ddL M
nullableddN V
:ddV W
falseddX ]
)dd] ^
,dd^ _
ProviderDisplayNameee '
=ee( )
tableee* /
.ee/ 0
Columnee0 6
<ee6 7
stringee7 =
>ee= >
(ee> ?
typeee? C
:eeC D
$streeE T
,eeT U
nullableeeV ^
:ee^ _
trueee` d
)eed e
,eee f
UserIdff 
=ff 
tableff "
.ff" #
Columnff# )
<ff) *
stringff* 0
>ff0 1
(ff1 2
typeff2 6
:ff6 7
$strff8 G
,ffG H
nullableffI Q
:ffQ R
falseffS X
)ffX Y
}gg 
,gg 
constraintshh 
:hh 
tablehh "
=>hh# %
{ii 
tablejj 
.jj 

PrimaryKeyjj $
(jj$ %
$strjj% :
,jj: ;
xjj< =
=>jj> @
newjjA D
{jjE F
xjjG H
.jjH I
LoginProviderjjI V
,jjV W
xjjX Y
.jjY Z
ProviderKeyjjZ e
}jjf g
)jjg h
;jjh i
tablekk 
.kk 

ForeignKeykk $
(kk$ %
namell 
:ll 
$strll F
,llF G
columnmm 
:mm 
xmm  !
=>mm" $
xmm% &
.mm& '
UserIdmm' -
,mm- .
principalTablenn &
:nn& '
$strnn( 5
,nn5 6
principalColumnoo '
:oo' (
$stroo) -
,oo- .
onDeletepp  
:pp  !
ReferentialActionpp" 3
.pp3 4
Cascadepp4 ;
)pp; <
;pp< =
}qq 
)qq 
;qq 
migrationBuilderss 
.ss 
CreateTabless (
(ss( )
namett 
:tt 
$strtt '
,tt' (
columnsuu 
:uu 
tableuu 
=>uu !
newuu" %
{vv 
UserIdww 
=ww 
tableww "
.ww" #
Columnww# )
<ww) *
stringww* 0
>ww0 1
(ww1 2
typeww2 6
:ww6 7
$strww8 G
,wwG H
nullablewwI Q
:wwQ R
falsewwS X
)wwX Y
,wwY Z
RoleIdxx 
=xx 
tablexx "
.xx" #
Columnxx# )
<xx) *
stringxx* 0
>xx0 1
(xx1 2
typexx2 6
:xx6 7
$strxx8 G
,xxG H
nullablexxI Q
:xxQ R
falsexxS X
)xxX Y
}yy 
,yy 
constraintszz 
:zz 
tablezz "
=>zz# %
{{{ 
table|| 
.|| 

PrimaryKey|| $
(||$ %
$str||% 9
,||9 :
x||; <
=>||= ?
new||@ C
{||D E
x||F G
.||G H
UserId||H N
,||N O
x||P Q
.||Q R
RoleId||R X
}||Y Z
)||Z [
;||[ \
table}} 
.}} 

ForeignKey}} $
(}}$ %
name~~ 
:~~ 
$str~~ E
,~~E F
column 
: 
x  !
=>" $
x% &
.& '
RoleId' -
,- .
principalTable
ÄÄ &
:
ÄÄ& '
$str
ÄÄ( 5
,
ÄÄ5 6
principalColumn
ÅÅ '
:
ÅÅ' (
$str
ÅÅ) -
,
ÅÅ- .
onDelete
ÇÇ  
:
ÇÇ  !
ReferentialAction
ÇÇ" 3
.
ÇÇ3 4
Cascade
ÇÇ4 ;
)
ÇÇ; <
;
ÇÇ< =
table
ÉÉ 
.
ÉÉ 

ForeignKey
ÉÉ $
(
ÉÉ$ %
name
ÑÑ 
:
ÑÑ 
$str
ÑÑ E
,
ÑÑE F
column
ÖÖ 
:
ÖÖ 
x
ÖÖ  !
=>
ÖÖ" $
x
ÖÖ% &
.
ÖÖ& '
UserId
ÖÖ' -
,
ÖÖ- .
principalTable
ÜÜ &
:
ÜÜ& '
$str
ÜÜ( 5
,
ÜÜ5 6
principalColumn
áá '
:
áá' (
$str
áá) -
,
áá- .
onDelete
àà  
:
àà  !
ReferentialAction
àà" 3
.
àà3 4
Cascade
àà4 ;
)
àà; <
;
àà< =
}
ââ 
)
ââ 
;
ââ 
migrationBuilder
ãã 
.
ãã 
CreateTable
ãã (
(
ãã( )
name
åå 
:
åå 
$str
åå (
,
åå( )
columns
çç 
:
çç 
table
çç 
=>
çç !
new
çç" %
{
éé 
UserId
èè 
=
èè 
table
èè "
.
èè" #
Column
èè# )
<
èè) *
string
èè* 0
>
èè0 1
(
èè1 2
type
èè2 6
:
èè6 7
$str
èè8 G
,
èèG H
nullable
èèI Q
:
èèQ R
false
èèS X
)
èèX Y
,
èèY Z
LoginProvider
êê !
=
êê" #
table
êê$ )
.
êê) *
Column
êê* 0
<
êê0 1
string
êê1 7
>
êê7 8
(
êê8 9
type
êê9 =
:
êê= >
$str
êê? N
,
êêN O
nullable
êêP X
:
êêX Y
false
êêZ _
)
êê_ `
,
êê` a
Name
ëë 
=
ëë 
table
ëë  
.
ëë  !
Column
ëë! '
<
ëë' (
string
ëë( .
>
ëë. /
(
ëë/ 0
type
ëë0 4
:
ëë4 5
$str
ëë6 E
,
ëëE F
nullable
ëëG O
:
ëëO P
false
ëëQ V
)
ëëV W
,
ëëW X
Value
íí 
=
íí 
table
íí !
.
íí! "
Column
íí" (
<
íí( )
string
íí) /
>
íí/ 0
(
íí0 1
type
íí1 5
:
íí5 6
$str
íí7 F
,
ííF G
nullable
ííH P
:
ííP Q
true
ííR V
)
ííV W
}
ìì 
,
ìì 
constraints
îî 
:
îî 
table
îî "
=>
îî# %
{
ïï 
table
ññ 
.
ññ 

PrimaryKey
ññ $
(
ññ$ %
$str
ññ% :
,
ññ: ;
x
ññ< =
=>
ññ> @
new
ññA D
{
ññE F
x
ññG H
.
ññH I
UserId
ññI O
,
ññO P
x
ññQ R
.
ññR S
LoginProvider
ññS `
,
ññ` a
x
ññb c
.
ññc d
Name
ññd h
}
ññi j
)
ññj k
;
ññk l
table
óó 
.
óó 

ForeignKey
óó $
(
óó$ %
name
òò 
:
òò 
$str
òò F
,
òòF G
column
ôô 
:
ôô 
x
ôô  !
=>
ôô" $
x
ôô% &
.
ôô& '
UserId
ôô' -
,
ôô- .
principalTable
öö &
:
öö& '
$str
öö( 5
,
öö5 6
principalColumn
õõ '
:
õõ' (
$str
õõ) -
,
õõ- .
onDelete
úú  
:
úú  !
ReferentialAction
úú" 3
.
úú3 4
Cascade
úú4 ;
)
úú; <
;
úú< =
}
ùù 
)
ùù 
;
ùù 
migrationBuilder
üü 
.
üü 
CreateIndex
üü (
(
üü( )
name
†† 
:
†† 
$str
†† 2
,
††2 3
table
°° 
:
°° 
$str
°° )
,
°°) *
column
¢¢ 
:
¢¢ 
$str
¢¢  
)
¢¢  !
;
¢¢! "
migrationBuilder
§§ 
.
§§ 
CreateIndex
§§ (
(
§§( )
name
•• 
:
•• 
$str
•• %
,
••% &
table
¶¶ 
:
¶¶ 
$str
¶¶ $
,
¶¶$ %
column
ßß 
:
ßß 
$str
ßß (
,
ßß( )
unique
®® 
:
®® 
true
®® 
,
®® 
filter
©© 
:
©© 
$str
©© 6
)
©©6 7
;
©©7 8
migrationBuilder
´´ 
.
´´ 
CreateIndex
´´ (
(
´´( )
name
¨¨ 
:
¨¨ 
$str
¨¨ 2
,
¨¨2 3
table
≠≠ 
:
≠≠ 
$str
≠≠ )
,
≠≠) *
column
ÆÆ 
:
ÆÆ 
$str
ÆÆ  
)
ÆÆ  !
;
ÆÆ! "
migrationBuilder
∞∞ 
.
∞∞ 
CreateIndex
∞∞ (
(
∞∞( )
name
±± 
:
±± 
$str
±± 2
,
±±2 3
table
≤≤ 
:
≤≤ 
$str
≤≤ )
,
≤≤) *
column
≥≥ 
:
≥≥ 
$str
≥≥  
)
≥≥  !
;
≥≥! "
migrationBuilder
µµ 
.
µµ 
CreateIndex
µµ (
(
µµ( )
name
∂∂ 
:
∂∂ 
$str
∂∂ 1
,
∂∂1 2
table
∑∑ 
:
∑∑ 
$str
∑∑ (
,
∑∑( )
column
∏∏ 
:
∏∏ 
$str
∏∏  
)
∏∏  !
;
∏∏! "
migrationBuilder
∫∫ 
.
∫∫ 
CreateIndex
∫∫ (
(
∫∫( )
name
ªª 
:
ªª 
$str
ªª "
,
ªª" #
table
ºº 
:
ºº 
$str
ºº $
,
ºº$ %
column
ΩΩ 
:
ΩΩ 
$str
ΩΩ )
)
ΩΩ) *
;
ΩΩ* +
migrationBuilder
øø 
.
øø 
CreateIndex
øø (
(
øø( )
name
¿¿ 
:
¿¿ 
$str
¿¿ %
,
¿¿% &
table
¡¡ 
:
¡¡ 
$str
¡¡ $
,
¡¡$ %
column
¬¬ 
:
¬¬ 
$str
¬¬ ,
,
¬¬, -
unique
√√ 
:
√√ 
true
√√ 
,
√√ 
filter
ƒƒ 
:
ƒƒ 
$str
ƒƒ :
)
ƒƒ: ;
;
ƒƒ; <
}
≈≈ 	
	protected
»» 
override
»» 
void
»» 
Down
»»  $
(
»»$ %
MigrationBuilder
»»% 5
migrationBuilder
»»6 F
)
»»F G
{
…… 	
migrationBuilder
   
.
   
	DropTable
   &
(
  & '
name
ÀÀ 
:
ÀÀ 
$str
ÀÀ (
)
ÀÀ( )
;
ÀÀ) *
migrationBuilder
ÕÕ 
.
ÕÕ 
	DropTable
ÕÕ &
(
ÕÕ& '
name
ŒŒ 
:
ŒŒ 
$str
ŒŒ (
)
ŒŒ( )
;
ŒŒ) *
migrationBuilder
–– 
.
–– 
	DropTable
–– &
(
––& '
name
—— 
:
—— 
$str
—— (
)
——( )
;
——) *
migrationBuilder
”” 
.
”” 
	DropTable
”” &
(
””& '
name
‘‘ 
:
‘‘ 
$str
‘‘ '
)
‘‘' (
;
‘‘( )
migrationBuilder
÷÷ 
.
÷÷ 
	DropTable
÷÷ &
(
÷÷& '
name
◊◊ 
:
◊◊ 
$str
◊◊ (
)
◊◊( )
;
◊◊) *
migrationBuilder
ŸŸ 
.
ŸŸ 
	DropTable
ŸŸ &
(
ŸŸ& '
name
⁄⁄ 
:
⁄⁄ 
$str
⁄⁄ #
)
⁄⁄# $
;
⁄⁄$ %
migrationBuilder
‹‹ 
.
‹‹ 
	DropTable
‹‹ &
(
‹‹& '
name
›› 
:
›› 
$str
›› #
)
››# $
;
››$ %
}
ﬁﬁ 	
}
ﬂﬂ 
}‡‡ ª
;E:\Work\Repos\EventEase\AuthService\Profiles\AuthProfile.cs
	namespace 	
AuthService
 
. 
Profiles 
{ 
public 

class 
AuthProfile 
: 
Profile %
{ 
public		 
AuthProfile		 
(		 
)		 
{

 	
	CreateMap 
< 
IdentityUser "
," #
ClientCreated$ 1
>1 2
(2 3
)3 4
;4 5
} 	
} 
} ¢h
.E:\Work\Repos\EventEase\AuthService\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
var 
rabbitMQ 
= 
$str 
; 
var 
	jwtConfig 
= 
$str 
; 
var 
connectionString 
= 
$str 
; 
if 
( 
builder 
. 
Environment 
. 
IsProduction $
($ %
)% &
)& '
{ 
rabbitMQ 
= 
Environment 
. "
GetEnvironmentVariable 1
(1 2
$str2 =
)= >
;> ?
Console 
. 
	WriteLine 
( 
rabbitMQ 
) 
;  
	jwtConfig 
= 
Environment 
. "
GetEnvironmentVariable 2
(2 3
$str3 8
)8 9
;9 :
Console 
. 
	WriteLine 
( 
	jwtConfig 
)  
;  !
connectionString 
= 
Environment "
." #"
GetEnvironmentVariable# 9
(9 :
$str: U
)U V
;V W
Console 
. 
	WriteLine 
( 
connectionString &
)& '
;' (
var 
jwtConfigObj 
= 
new 
	JwtConfig $
{ 
Secret 
= 
	jwtConfig 
?? 
throw #
new$ '%
InvalidOperationException( A
(A B
$strB l
)l m
} 
; 
builder!! 
.!! 
Services!! 
.!! 
AddSingleton!! !
(!!! "
jwtConfigObj!!" .
)!!. /
;!!/ 0
builder$$ 
.$$ 
Services$$ 
.$$ 
	Configure$$ 
<$$ 
	JwtConfig$$ (
>$$( )
($$) *
config$$* 0
=>$$1 3
{%% 
config&& 
.&& 
Secret&& 
=&& 
jwtConfigObj&& $
.&&$ %
Secret&&% +
;&&+ ,
}'' 
)'' 
;'' 
Console)) 
.)) 
	WriteLine)) 
()) 
$str)) 0
)))0 1
;))1 2
builder** 
.** 
Services** 
.** 
AddDbContext** !
<**! "
AppDbContext**" .
>**. /
(**/ 0
options**0 7
=>**8 :
options++ 
.++ 
UseSqlServer++ 
(++ 
connectionString++ -
)++- .
),, 
;,, 
}-- 
else.. 
{// 
rabbitMQ00 
=00 
$"00 
$str00 $
{00$ %
builder00% ,
.00, -
Configuration00- :
[00: ;
$str00; I
]00I J
}00J K
$str00K L
{00L M
builder00M T
.00T U
Configuration00U b
[00b c
$str00c q
]00q r
}00r s
"00s t
;00t u
	jwtConfig11 
=11 
builder11 
.11 
Configuration11 %
.11% &

GetSection11& 0
(110 1
$str111 C
)11C D
.11D E
Value11E J
;11J K
connectionString33 
=33 
builder33 
.33 
Configuration33 ,
.33, -
GetConnectionString33- @
(33@ A
$str33A T
)33T U
;33U V
Console55 
.55 
	WriteLine55 
(55 
$str55 ,
)55, -
;55- .
builder66 
.66 
Services66 
.66 
AddDbContext66 !
<66! "
AppDbContext66" .
>66. /
(66/ 0
opt660 3
=>664 6
opt77 

.77
 
UseInMemoryDatabase77 
(77 
$str77 &
)77& '
)88 
;88 
builder:: 
.:: 
Services:: 
.:: 
	Configure:: 
<:: 
	JwtConfig:: (
>::( )
(::) *
builder::* 1
.::1 2
Configuration::2 ?
.::? @

GetSection::@ J
(::J K
$str::K V
)::V W
)::W X
;::X Y
}@@ 
builderDD 
.DD 
ServicesDD 
.DD 
AddAutoMapperDD 
(DD 
	AppDomainDD (
.DD( )
CurrentDomainDD) 6
.DD6 7
GetAssembliesDD7 D
(DDD E
)DDE F
)DDF G
;DDG H
builderFF 
.FF 
ServicesFF 
.FF 
AddMassTransitFF 
(FF  
configFF  &
=>FF' )
{FF* +
ConsoleGG 
.GG 
	WriteLineGG 
(GG 
rabbitMQGG 
)GG 
;GG  
configJJ 

.JJ
 
AddConsumerJJ 
<JJ !
ClientDeletedConsumerJJ ,
>JJ, -
(JJ- .
)JJ. /
;JJ/ 0
configKK 

.KK
 
AddConsumerKK 
<KK  
VenueDeletedConsumerKK +
>KK+ ,
(KK, -
)KK- .
;KK. /
configMM 

.MM
 -
!SetKebabCaseEndpointNameFormatterMM ,
(MM, -
)MM- .
;MM. /
configOO 

.OO
 
UsingRabbitMqOO 
(OO 
(OO 
ctxOO 
,OO 
cfgOO "
)OO" #
=>OO$ &
{OO' (
cfgPP 
.PP 
HostPP 
(PP 
rabbitMQPP 
)PP 
;PP 
cfgRR 
.RR 
ReceiveEndpointRR 
(RR 
$strRR A
,RRA B
cRRC D
=>RRE G
{RRH I
cTT 
.TT 
ConfigureConsumerTT 
<TT  !
ClientDeletedConsumerTT  5
>TT5 6
(TT6 7
ctxTT7 :
)TT: ;
;TT; <
}UU 	
)UU	 

;UU
 
cfgWW 
.WW 
ReceiveEndpointWW 
(WW 
$strWW @
,WW@ A
cWWB C
=>WWD F
{WWG H
cYY 
.YY 
ConfigureConsumerYY 
<YY   
VenueDeletedConsumerYY  4
>YY4 5
(YY5 6
ctxYY6 9
)YY9 :
;YY: ;
}ZZ 	
)ZZ	 

;ZZ
 
}[[ 
)[[ 
;[[ 
}\\ 
)\\ 
;\\ 
var__ "
allowedSpecificOrigins__ 
=__ 
$str__ 6
;__6 7
builderaa 
.aa 
Servicesaa 
.aa 
AddCorsaa 
(aa 
optionsaa  
=>aa! #
{bb 
optionscc 
.cc 
	AddPolicycc 
(cc 
namecc 
:cc "
allowedSpecificOriginscc 2
,cc2 3
policydd 
=>dd 
{ee 	
policyff 
.ff 
WithOriginsff 
(ff 
$strff 4
,ff4 5
$strgg  7
)gg7 8
;gg8 9
}hh 	
)ii 
;ii 
}jj 
)jj 
;jj 
buildernn 
.nn 
Servicesnn 
.nn 
AddControllersnn 
(nn  
)nn  !
;nn! "
builderpp 
.pp 
Servicespp 
.pp #
AddEndpointsApiExplorerpp (
(pp( )
)pp) *
;pp* +
builderqq 
.qq 
Servicesqq 
.qq 
AddSwaggerGenqq 
(qq 
)qq  
;qq  !
buildertt 
.tt 
Servicestt 
.tt 
AddIdentitytt 
<tt 
IdentityUsertt )
,tt) *
IdentityRolett+ 7
>tt7 8
(tt8 9
optionstt9 @
=>ttA C
{uu 
optionsvv 
.vv 
SignInvv 
.vv #
RequireConfirmedAccountvv .
=vv/ 0
falsevv1 6
;vv6 7
optionsww 
.ww 
Userww 
.ww 
RequireUniqueEmailww '
=ww( )
trueww* .
;ww. /
optionsxx 
.xx 
Passwordxx 
.xx 
RequireUppercasexx )
=xx* +
truexx, 0
;xx0 1
optionsyy 
.yy 
Passwordyy 
.yy 
RequireLowercaseyy )
=yy* +
trueyy, 0
;yy0 1
optionszz 
.zz 
Passwordzz 
.zz 
RequireDigitzz %
=zz& '
truezz( ,
;zz, -
}{{ 
){{ 
.|| $
AddEntityFrameworkStores|| 
<|| 
AppDbContext|| *
>||* +
(||+ ,
)||, -
;||- .
builder 
. 
Services 
. 
AddAuthentication "
(" #
options# *
=>+ -
{
ÄÄ 
options
ÅÅ 
.
ÅÅ '
DefaultAuthenticateScheme
ÅÅ )
=
ÅÅ* +
JwtBearerDefaults
ÅÅ, =
.
ÅÅ= >"
AuthenticationScheme
ÅÅ> R
;
ÅÅR S
options
ÇÇ 
.
ÇÇ 
DefaultScheme
ÇÇ 
=
ÇÇ 
JwtBearerDefaults
ÇÇ  1
.
ÇÇ1 2"
AuthenticationScheme
ÇÇ2 F
;
ÇÇF G
options
ÉÉ 
.
ÉÉ $
DefaultChallengeScheme
ÉÉ &
=
ÉÉ' (
JwtBearerDefaults
ÉÉ) :
.
ÉÉ: ;"
AuthenticationScheme
ÉÉ; O
;
ÉÉO P
}
ÑÑ 
)
ÑÑ 
.
ÖÖ 
AddJwtBearer
ÖÖ 
(
ÖÖ 
jwt
ÖÖ 
=>
ÖÖ 
{
ÜÜ 
var
áá 
key
áá 
=
áá 
Encoding
áá 
.
áá 
ASCII
áá  
.
áá  !
GetBytes
áá! )
(
áá) *
	jwtConfig
áá* 3
)
áá3 4
;
áá4 5
jwt
àà 
.
àà 
	SaveToken
àà 
=
àà 
true
àà 
;
àà 
jwt
ää 
.
ää '
TokenValidationParameters
ää %
=
ää& '
new
ää( +'
TokenValidationParameters
ää, E
(
ääE F
)
ääF G
{
ãã 	&
ValidateIssuerSigningKey
åå $
=
åå% &
true
åå' +
,
åå+ ,
IssuerSigningKey
çç 
=
çç 
new
çç ""
SymmetricSecurityKey
çç# 7
(
çç7 8
key
çç8 ;
)
çç; <
,
çç< =
ValidateIssuer
éé 
=
éé 
false
éé "
,
éé" #
ValidateAudience
èè 
=
èè 
false
èè $
,
èè$ %#
RequireExpirationTime
ëë !
=
ëë" #
true
ëë$ (
,
ëë( )
ValidateLifetime
íí 
=
íí 
true
íí #
,
íí# $
	ClockSkew
ìì 
=
ìì 
TimeSpan
ìì  
.
ìì  !
Zero
ìì! %
}
îî 	
;
îî	 

}
ïï 
)
ïï 
;
ïï 
builderóó 
.
óó 
Services
óó 
.
óó 
AddAuthorization
óó !
(
óó! "
)
óó" #
;
óó# $
varôô 
app
ôô 
=
ôô 	
builder
ôô
 
.
ôô 
Build
ôô 
(
ôô 
)
ôô 
;
ôô 
ifúú 
(
úú 
app
úú 
.
úú 
Environment
úú 
.
úú 
IsDevelopment
úú !
(
úú! "
)
úú" #
)
úú# $
{ùù 
app
ûû 
.
ûû 

UseSwagger
ûû 
(
ûû 
)
ûû 
;
ûû 
app
üü 
.
üü 
UseSwaggerUI
üü 
(
üü 
)
üü 
;
üü 
}†† 
app¢¢ 
.
¢¢ !
UseHttpsRedirection
¢¢ 
(
¢¢ 
)
¢¢ 
;
¢¢ 
app§§ 
.
§§ 
UseCors
§§ 
(
§§ $
allowedSpecificOrigins
§§ "
)
§§" #
;
§§# $
app¶¶ 
.
¶¶ 
UseAuthentication
¶¶ 
(
¶¶ 
)
¶¶ 
;
¶¶ 
appßß 
.
ßß 
UseAuthorization
ßß 
(
ßß 
)
ßß 
;
ßß 
app©© 
.
©© 
MapControllers
©© 
(
©© 
)
©© 
;
©© 
PrepData´´ 
.
´´ 	
PrepPopulation
´´	 
(
´´ 
app
´´ 
,
´´ 
app
´´  
.
´´  !
Environment
´´! ,
.
´´, -
IsProduction
´´- 9
(
´´9 :
)
´´: ;
)
´´; <
;
´´< =
app≠≠ 
.
≠≠ 
Run
≠≠ 
(
≠≠ 
)
≠≠ 	
;
≠≠	 
