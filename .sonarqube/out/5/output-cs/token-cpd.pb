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
} ‹
DE:\Work\Repos\EventEase\AuthService\Consumers\UserDeletedConsumer.cs
	namespace 	
AuthService
 
. 
	Consumers 
{ 
public		 

class		 
UserDeletedConsumer		 $
:		% &
	IConsumer		' 0
<		0 1
UserDeleted		1 <
>		< =
{

 
private 
readonly 
ILogger  
<  !
UserDeleted! ,
>, -
_logger. 5
;5 6
private 
readonly 
UserManager $
<$ %
IdentityUser% 1
>1 2
_userManager3 ?
;? @
private 
readonly 
IMapper  
_mapper! (
;( )
public 
UserDeletedConsumer "
(" #
ILogger# *
<* +
UserDeleted+ 6
>6 7
logger8 >
,> ?
UserManager@ K
<K L
IdentityUserL X
>X Y
userManagerZ e
,e f
IMapperg n
mappero u
)u v
{ 	
_logger 
= 
logger 
; 
_userManager 
= 
userManager &
;& '
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
Consume !
(! "
ConsumeContext" 0
<0 1
UserDeleted1 <
>< =
context> E
)E F
{ 	
var 
userDeleted 
= 
context %
.% &
Message& -
;- .
_logger 
. 
LogInformation "
(" #
$"# %
$str% ;
{; <
userDeleted< G
.G H
IdH J
}J K
"K L
)L M
;M N
var 
	userModel 
= 
await !
_userManager" .
.. /
FindByIdAsync/ <
(< =
userDeleted= H
.H I
IdI K
)K L
;L M
var 
	isDeleted 
= 
await !
_userManager" .
.. /
DeleteAsync/ :
(: ;
	userModel; D
)D E
;E F
Console!! 
.!! 
	WriteLine!! 
(!! 
$"!!  
$str!!  0
{!!0 1
userDeleted!!1 <
.!!< =
Id!!= ?
}!!? @
$str!!@ J
{!!J K
	isDeleted!!K T
}!!T U
"!!U V
)!!V W
;!!W X
}"" 	
}## 
}$$ ‚W
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
['' 	
HttpPost''	 
]'' 
[(( 	
Route((	 
((( 
$str(( 
)(( 
](( 
public)) 
async)) 
Task)) 
<)) 
IActionResult)) '
>))' (
Login))) .
()). /
[))/ 0
FromBody))0 8
]))8 9
LoginDto)): B
loginDto))C K
)))K L
{** 	
if++ 
(++ 

ModelState++ 
.++ 
IsValid++ !
)++! "
{++" #
var,, 
user,, 
=,, 
await,,  
_userManager,,! -
.,,- .
FindByEmailAsync,,. >
(,,> ?
loginDto,,? G
.,,G H
Email,,H M
),,M N
;,,N O
if.. 
(.. 
user.. 
==.. 
null.. 
)..  
{..  !
return// 

BadRequest// %
(//% &
$str//& >
)//> ?
;//? @
}00 
var22 
isPasswordValid22 #
=22$ %
await22& +
_userManager22, 8
.228 9
CheckPasswordAsync229 K
(22K L
user22L P
,22P Q
loginDto22R Z
.22Z [
Password22[ c
)22c d
;22d e
if44 
(44 
isPasswordValid44 "
)44" #
{55 
var66 

userClaims66 "
=66# $
await66% *
_userManager66+ 7
.667 8
GetClaimsAsync668 F
(66F G
user66G K
)66K L
;66L M
var77 
	userRoles77 !
=77" #
await77$ )
_userManager77* 6
.776 7
GetRolesAsync777 D
(77D E
user77E I
)77I J
;77J K
var99 
token99 
=99 
await99  %
	JWTHelper99& /
.99/ 0
GenerateJwtToken990 @
(99@ A
user99A E
,99E F

_jwtConfig99G Q
,99Q R

userClaims99S ]
,99] ^
	userRoles99_ h
)99h i
;99i j
return;; 
Ok;; 
(;; 
new;; !
UserLoginResDto;;" 1
(;;1 2
);;2 3
{<< 
Token== 
=== 
token==  %
,==% &
Result>> 
=>>  
true>>! %
}?? 
)?? 
;?? 
}@@ 
returnBB 

BadRequestBB !
(BB! "
$strBB" :
)BB: ;
;BB; <
}CC 
returnEE 

BadRequestEE 
(EE 
$strEE 7
)EE7 8
;EE8 9
}FF 	
[HH 	
HttpPostHH	 
]HH 
[II 	
RouteII	 
(II 
$strII 
)II 
]II 
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
IActionResultJJ '
>JJ' (
RegisterJJ) 1
(JJ1 2
[JJ2 3
FromBodyJJ3 ;
]JJ; <
UserRegisterDtoJJ= L
registerDtoJJM X
)JJX Y
{KK 	
ifLL 
(LL 

ModelStateLL 
.LL 
IsValidLL !
)LL! "
{MM 
varOO 
emailExistsOO 
=OO  !
awaitOO" '
_userManagerOO( 4
.OO4 5
FindByEmailAsyncOO5 E
(OOE F
registerDtoOOF Q
.OOQ R
EmailOOR W
)OOW X
;OOX Y
ifQQ 
(QQ 
emailExistsQQ 
!=QQ !
nullQQ" &
)QQ& '
{RR 
returnSS 

BadRequestSS %
(SS% &
$strSS& M
)SSM N
;SSN O
}TT 
varVV 
userVV 
=VV 
newVV 
IdentityUserVV +
(VV+ ,
)VV, -
{WW 
EmailXX 
=XX 
registerDtoXX '
.XX' (
EmailXX( -
,XX- .
UserNameYY 
=YY 
registerDtoYY *
.YY* +
EmailYY+ 0
}ZZ 
;ZZ 
var\\ 
	isCreated\\ 
=\\ 
await\\  %
_userManager\\& 2
.\\2 3
CreateAsync\\3 >
(\\> ?
user\\? C
,\\C D
registerDto\\E P
.\\P Q
Password\\Q Y
)\\Y Z
;\\Z [
if^^ 
(^^ 
	isCreated^^ 
.^^ 
	Succeeded^^ &
)^^& '
{__ 
varaa 

roleExistsaa "
=aa# $
awaitaa% *
_roleManageraa+ 7
.aa7 8
RoleExistsAsyncaa8 G
(aaG H
registerDtoaaH S
.aaS T
RoleaaT X
)aaX Y
;aaY Z
ifbb 
(bb 
!bb 

roleExistsbb #
)bb# $
{cc 
_loggerdd 
.dd  
LogInformationdd  .
(dd. /
$"dd/ 1
$strdd1 <
{dd< =
registerDtodd= H
.ddH I
RoleddI M
}ddM N
$strddN ^
"dd^ _
)dd_ `
;dd` a
returnee 

BadRequestee )
(ee) *
$"ee* ,
$stree, 7
{ee7 8
registerDtoee8 C
.eeC D
RoleeeD H
}eeH I
$streeI Y
"eeY Z
)eeZ [
;ee[ \
}ff 
varii 
resultii 
=ii  
awaitii! &
_userManagerii' 3
.ii3 4
AddToRoleAsyncii4 B
(iiB C
useriiC G
,iiG H
registerDtoiiI T
.iiT U
RoleiiU Y
)iiY Z
;iiZ [
ifkk 
(kk 
resultkk 
.kk 
	Succeededkk (
)kk( )
{ll 
_loggermm 
.mm  
LogInformationmm  .
(mm. /
$"mm/ 1
$strmm1 n
{mmn o
usermmo s
.mms t
Emailmmt y
}mmy z
$strmmz {
"mm{ |
)mm| }
;mm} ~
}nn 
varrr 
userCreatedrr #
=rr$ %
newrr& )
UserCreatedrr* 5
(rr5 6
)rr6 7
{rr8 9
Idss 
=ss 
userss !
.ss! "
Idss" $
,ss$ %
Namett 
=tt 
registerDtott *
.tt* +
Namett+ /
,tt/ 0
Emailuu 
=uu 
useruu  $
.uu$ %
Emailuu% *
,uu* +
Rolevv 
=vv 
registerDtovv *
.vv* +
Rolevv+ /
}ww 
;ww 
Consolexx 
.xx 
	WriteLinexx %
(xx% &
$"xx& (
$strxx( J
{xxJ K
userCreatedxxK V
.xxV W
IdxxW Y
}xxY Z
"xxZ [
)xx[ \
;xx\ ]
awaityy 
_publishEndpointyy *
.yy* +
Publishyy+ 2
<yy2 3
UserCreatedyy3 >
>yy> ?
(yy? @
userCreatedyy@ K
)yyK L
;yyL M
var|| 

userClaims|| "
=||# $
await||% *
_userManager||+ 7
.||7 8
GetClaimsAsync||8 F
(||F G
user||G K
)||K L
;||L M
var}} 
	userRoles}} !
=}}" #
await}}$ )
_userManager}}* 6
.}}6 7
GetRolesAsync}}7 D
(}}D E
user}}E I
)}}I J
;}}J K
var 
token 
= 
await  %
	JWTHelper& /
./ 0
GenerateJwtToken0 @
(@ A
userA E
,E F

_jwtConfigG Q
,Q R

userClaimsS ]
,] ^
	userRoles_ h
)h i
;i j
return
ÄÄ 
Ok
ÄÄ 
(
ÄÄ 
new
ÄÄ ! 
UserRegisterResDto
ÄÄ" 4
(
ÄÄ4 5
)
ÄÄ5 6
{
ÅÅ 
Result
ÇÇ 
=
ÇÇ  
true
ÇÇ! %
,
ÇÇ% &
Token
ÉÉ 
=
ÉÉ 
token
ÉÉ  %
}
ÑÑ 
)
ÑÑ 
;
ÑÑ 
}
ÖÖ 
return
áá 

BadRequest
áá !
(
áá! "
	isCreated
áá" +
.
áá+ ,
Errors
áá, 2
.
áá2 3
Select
áá3 9
(
áá9 :
x
áá: ;
=>
áá< >
x
áá? @
.
áá@ A
Description
ááA L
)
ááL M
.
ááM N
ToList
ááN T
(
ááT U
)
ááU V
)
ááV W
;
ááW X
}
àà 
return
ää 

BadRequest
ää 
(
ää 
$str
ää 7
)
ää7 8
;
ää8 9
}
ãã 	
}
éé 
}èè Ém
AE:\Work\Repos\EventEase\AuthService\Controllers\RoleController.cs
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
$str 
) 
] 
public 

class 
RoleController 
:  !
ControllerBase" 0
{ 
private 
readonly 
ApiDbContext %
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
<  !
RoleController! /
>/ 0
_logger1 8
;8 9
public 
RoleController 
( 
ApiDbContext *
apiDbContext+ 7
,7 8
UserManager9 D
<D E
IdentityUserE Q
>Q R
userManagerS ^
,^ _
RoleManager` k
<k l
IdentityRolel x
>x y
roleManager	z Ö
,
Ö Ü
ILogger
á é
<
é è
RoleController
è ù
>
ù û
logger
ü •
)
• ¶
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
8E:\Work\Repos\EventEase\AuthService\Data\ApiDbContext.cs
	namespace 	
AuthService
 
. 
Data 
{ 
public 

class 
ApiDbContext 
: 
IdentityDbContext  1
{ 
public 
ApiDbContext 
( 
DbContextOptions ,
<, -
ApiDbContext- 9
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
} –
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
} Ω
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
 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
] 
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
public 
string 
Role 
{ 
get  
;  !
set" %
;% &
}' (
} 
} µ
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
} Ë
9E:\Work\Repos\EventEase\AuthService\Events\UserCreated.cs
	namespace 	
MessageBusEvents
 
. 
Models !
{ 
public 

class 
UserCreated 
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}$ %
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Role 
{ 
get  
;  !
set" %
;% &
}' (
}		 
}

 ü
9E:\Work\Repos\EventEase\AuthService\Events\UserDeleted.cs
	namespace 	
MessageBusEvents
 
. 
Models !
{ 
public 

class 
UserDeleted 
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
} 
} ‹'
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
." #
UtcNow# )
.) *
AddHours* 2
(2 3
$num3 4
)4 5
,5 6
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
,--Q R
}// 
;// 
claims11 
.11 
AddRange11 
(11 

userClaims11 &
)11& '
;11' (
foreach44 
(44 
var44 
role44 
in44 
	userRoles44  )
)44) *
{55 
claims66 
.66 
Add66 
(66 
new66 
Claim66 $
(66$ %

ClaimTypes66% /
.66/ 0
Role660 4
,664 5
role666 :
)66: ;
)66; <
;66< =
}77 
return99 
claims99 
;99 
}:: 	
};; 
}<< ºƒ
RE:\Work\Repos\EventEase\AuthService\Migrations\20231104175939_initial-migration.cs
	namespace 	
AuthService
 
. 

Migrations  
{ 
public		 

partial		 
class		 
initialmigration		 )
:		* +
	Migration		, 5
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
$str4 :
,: ;
nullable< D
:D E
falseF K
)K L
,L M
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
$str6 <
,< =
	maxLength> G
:G H
$numI L
,L M
nullableN V
:V W
trueX \
)\ ]
,] ^
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
$str@ F
,F G
	maxLengthH Q
:Q R
$numS V
,V W
nullableX `
:` a
trueb f
)f g
,g h
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
$strB H
,H I
nullableJ R
:R S
trueT X
)X Y
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
$str  4 :
,  : ;
nullable  < D
:  D E
false  F K
)  K L
,  L M
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
$str!!: @
,!!@ A
	maxLength!!B K
:!!K L
$num!!M P
,!!P Q
nullable!!R Z
:!!Z [
true!!\ `
)!!` a
,!!a b
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
$str""D J
,""J K
	maxLength""L U
:""U V
$num""W Z
,""Z [
nullable""\ d
:""d e
true""f j
)""j k
,""k l
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
$str##7 =
,##= >
	maxLength##? H
:##H I
$num##J M
,##M N
nullable##O W
:##W X
true##Y ]
)##] ^
,##^ _
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
$str$$A G
,$$G H
	maxLength$$I R
:$$R S
$num$$T W
,$$W X
nullable$$Y a
:$$a b
true$$c g
)$$g h
,$$h i
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
$str%%> G
,%%G H
nullable%%I Q
:%%Q R
false%%S X
)%%X Y
,%%Y Z
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
$str&&> D
,&&D E
nullable&&F N
:&&N O
true&&P T
)&&T U
,&&U V
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
$str''? E
,''E F
nullable''G O
:''O P
true''Q U
)''U V
,''V W
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
$str((B H
,((H I
nullable((J R
:((R S
true((T X
)((X Y
,((Y Z
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
$str))= C
,))C D
nullable))E M
:))M N
true))O S
)))S T
,))T U 
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
$str**D M
,**M N
nullable**O W
:**W X
false**Y ^
)**^ _
,**_ `
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
$str++@ I
,++I J
nullable++K S
:++S T
false++U Z
)++Z [
,++[ \

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
$str,,D J
,,,J K
nullable,,L T
:,,T U
true,,V Z
),,Z [
,,,[ \
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
$str--> G
,--G H
nullable--I Q
:--Q R
false--S X
)--X Y
,--Y Z
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
$str..@ I
,..I J
nullable..K S
:..S T
false..U Z
)..Z [
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
$str991 :
,99: ;
nullable99< D
:99D E
false99F K
)99K L
.:: 

Annotation:: #
(::# $
$str::$ :
,::: ;
true::< @
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
$str;;8 >
,;;> ?
nullable;;@ H
:;;H I
false;;J O
);;O P
,;;P Q
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
$str<<; A
,<<A B
nullable<<C K
:<<K L
true<<M Q
)<<Q R
,<<R S

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
$str==< B
,==B C
nullable==D L
:==L M
true==N R
)==R S
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
$strNN1 :
,NN: ;
nullableNN< D
:NND E
falseNNF K
)NNK L
.OO 

AnnotationOO #
(OO# $
$strOO$ :
,OO: ;
trueOO< @
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
$strPP8 >
,PP> ?
nullablePP@ H
:PPH I
falsePPJ O
)PPO P
,PPP Q
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
$strQQ; A
,QQA B
nullableQQC K
:QQK L
trueQQM Q
)QQQ R
,QQR S

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
$strRR< B
,RRB C
nullableRRD L
:RRL M
trueRRN R
)RRR S
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
$strcc? E
,ccE F
nullableccG O
:ccO P
falseccQ V
)ccV W
,ccW X
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
$strdd= C
,ddC D
nullableddE M
:ddM N
falseddO T
)ddT U
,ddU V
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
$streeE K
,eeK L
nullableeeM U
:eeU V
trueeeW [
)ee[ \
,ee\ ]
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
$strff8 >
,ff> ?
nullableff@ H
:ffH I
falseffJ O
)ffO P
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
$strww8 >
,ww> ?
nullableww@ H
:wwH I
falsewwJ O
)wwO P
,wwP Q
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
$strxx8 >
,xx> ?
nullablexx@ H
:xxH I
falsexxJ O
)xxO P
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
èè8 >
,
èè> ?
nullable
èè@ H
:
èèH I
false
èèJ O
)
èèO P
,
èèP Q
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
êê? E
,
êêE F
nullable
êêG O
:
êêO P
false
êêQ V
)
êêV W
,
êêW X
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
ëë6 <
,
ëë< =
nullable
ëë> F
:
ëëF G
false
ëëH M
)
ëëM N
,
ëëN O
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
íí7 =
,
íí= >
nullable
íí? G
:
ííG H
true
ííI M
)
ííM N
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
)
®® 
;
®® 
migrationBuilder
™™ 
.
™™ 
CreateIndex
™™ (
(
™™( )
name
´´ 
:
´´ 
$str
´´ 2
,
´´2 3
table
¨¨ 
:
¨¨ 
$str
¨¨ )
,
¨¨) *
column
≠≠ 
:
≠≠ 
$str
≠≠  
)
≠≠  !
;
≠≠! "
migrationBuilder
ØØ 
.
ØØ 
CreateIndex
ØØ (
(
ØØ( )
name
∞∞ 
:
∞∞ 
$str
∞∞ 2
,
∞∞2 3
table
±± 
:
±± 
$str
±± )
,
±±) *
column
≤≤ 
:
≤≤ 
$str
≤≤  
)
≤≤  !
;
≤≤! "
migrationBuilder
¥¥ 
.
¥¥ 
CreateIndex
¥¥ (
(
¥¥( )
name
µµ 
:
µµ 
$str
µµ 1
,
µµ1 2
table
∂∂ 
:
∂∂ 
$str
∂∂ (
,
∂∂( )
column
∑∑ 
:
∑∑ 
$str
∑∑  
)
∑∑  !
;
∑∑! "
migrationBuilder
ππ 
.
ππ 
CreateIndex
ππ (
(
ππ( )
name
∫∫ 
:
∫∫ 
$str
∫∫ "
,
∫∫" #
table
ªª 
:
ªª 
$str
ªª $
,
ªª$ %
column
ºº 
:
ºº 
$str
ºº )
)
ºº) *
;
ºº* +
migrationBuilder
ææ 
.
ææ 
CreateIndex
ææ (
(
ææ( )
name
øø 
:
øø 
$str
øø %
,
øø% &
table
¿¿ 
:
¿¿ 
$str
¿¿ $
,
¿¿$ %
column
¡¡ 
:
¡¡ 
$str
¡¡ ,
,
¡¡, -
unique
¬¬ 
:
¬¬ 
true
¬¬ 
)
¬¬ 
;
¬¬ 
}
√√ 	
	protected
∆∆ 
override
∆∆ 
void
∆∆ 
Down
∆∆  $
(
∆∆$ %
MigrationBuilder
∆∆% 5
migrationBuilder
∆∆6 F
)
∆∆F G
{
«« 	
migrationBuilder
»» 
.
»» 
	DropTable
»» &
(
»»& '
name
…… 
:
…… 
$str
…… (
)
……( )
;
……) *
migrationBuilder
ÀÀ 
.
ÀÀ 
	DropTable
ÀÀ &
(
ÀÀ& '
name
ÃÃ 
:
ÃÃ 
$str
ÃÃ (
)
ÃÃ( )
;
ÃÃ) *
migrationBuilder
ŒŒ 
.
ŒŒ 
	DropTable
ŒŒ &
(
ŒŒ& '
name
œœ 
:
œœ 
$str
œœ (
)
œœ( )
;
œœ) *
migrationBuilder
—— 
.
—— 
	DropTable
—— &
(
——& '
name
““ 
:
““ 
$str
““ '
)
““' (
;
““( )
migrationBuilder
‘‘ 
.
‘‘ 
	DropTable
‘‘ &
(
‘‘& '
name
’’ 
:
’’ 
$str
’’ (
)
’’( )
;
’’) *
migrationBuilder
◊◊ 
.
◊◊ 
	DropTable
◊◊ &
(
◊◊& '
name
ÿÿ 
:
ÿÿ 
$str
ÿÿ #
)
ÿÿ# $
;
ÿÿ$ %
migrationBuilder
⁄⁄ 
.
⁄⁄ 
	DropTable
⁄⁄ &
(
⁄⁄& '
name
€€ 
:
€€ 
$str
€€ #
)
€€# $
;
€€$ %
}
‹‹ 	
}
›› 
}ﬁﬁ ›
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
," #
UserCreated$ /
>/ 0
(0 1
)1 2
;2 3
	CreateMap 
< 
UserDeleted !
,! "
IdentityUser# /
>/ 0
(0 1
)1 2
;2 3
} 	
} 
} ∆:
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
= 
$" 
$str $
{$ %
builder% ,
., -
Configuration- :
[: ;
$str; I
]I J
}J K
$strK L
{L M
builderM T
.T U
ConfigurationU b
[b c
$strc q
]q r
}r s
"s t
;t u
builder 
. 
Services 
. 
	Configure 
< 
	JwtConfig $
>$ %
(% &
builder& -
.- .
Configuration. ;
.; <

GetSection< F
(F G
$strG R
)R S
)S T
;T U
builder 
. 
Services 
. 
AddDbContext 
< 
ApiDbContext *
>* +
(+ ,
options, 3
=>4 6
options 
. 
	UseSqlite 
( 
builder 
. 
Configuration +
.+ ,
GetConnectionString, ?
(? @
$str@ S
)S T
)T U
)U V
;V W
builder 
. 
Services 
. 
AddAutoMapper 
( 
	AppDomain (
.( )
CurrentDomain) 6
.6 7
GetAssemblies7 D
(D E
)E F
)F G
;G H
builder 
. 
Services 
. 
AddMassTransit 
(  
config  &
=>' )
{* +
Console 
. 
	WriteLine 
( 
rabbitMQ 
) 
;  
config 

.
 
AddConsumer 
< 
UserDeletedConsumer *
>* +
(+ ,
), -
;- .
config 

.
 -
!SetKebabCaseEndpointNameFormatter ,
(, -
)- .
;. /
config!! 

.!!
 
UsingRabbitMq!! 
(!! 
(!! 
ctx!! 
,!! 
cfg!! "
)!!" #
=>!!$ &
{!!' (
cfg"" 
."" 
Host"" 
("" 
rabbitMQ"" 
)"" 
;"" 
cfg$$ 
.$$ 
ReceiveEndpoint$$ 
($$ 
$str$$ 3
,$$3 4
c$$5 6
=>$$7 9
{$$: ;
c&& 
.&& 
ConfigureConsumer&& 
<&&  
UserDeletedConsumer&&  3
>&&3 4
(&&4 5
ctx&&5 8
)&&8 9
;&&9 :
}'' 	
)''	 

;''
 
}(( 
)(( 
;(( 
})) 
))) 
;)) 
builder++ 
.++ 
Services++ 
.++ 
AddControllers++ 
(++  
)++  !
;++! "
builder-- 
.-- 
Services-- 
.-- #
AddEndpointsApiExplorer-- (
(--( )
)--) *
;--* +
builder.. 
... 
Services.. 
... 
AddSwaggerGen.. 
(.. 
)..  
;..  !
builder11 
.11 
Services11 
.11 
AddIdentity11 
<11 
IdentityUser11 )
,11) *
IdentityRole11+ 7
>117 8
(118 9
options119 @
=>11A C
{22 
options33 
.33 
SignIn33 
.33 #
RequireConfirmedAccount33 .
=33/ 0
false331 6
;336 7
}44 
)44 
.55 $
AddEntityFrameworkStores55 
<55 
ApiDbContext55 *
>55* +
(55+ ,
)55, -
;55- .
builder88 
.88 
Services88 
.88 
AddAuthentication88 "
(88" #
options88# *
=>88+ -
{99 
options:: 
.:: %
DefaultAuthenticateScheme:: )
=::* +
JwtBearerDefaults::, =
.::= > 
AuthenticationScheme::> R
;::R S
options;; 
.;; 
DefaultScheme;; 
=;; 
JwtBearerDefaults;;  1
.;;1 2 
AuthenticationScheme;;2 F
;;;F G
options<< 
.<< "
DefaultChallengeScheme<< &
=<<' (
JwtBearerDefaults<<) :
.<<: ; 
AuthenticationScheme<<; O
;<<O P
}== 
)== 
.>> 
AddJwtBearer>> 
(>> 
jwt>> 
=>>> 
{?? 
var@@ 
key@@ 
=@@ 
Encoding@@ 
.@@ 
ASCII@@  
.@@  !
GetBytes@@! )
(@@) *
builder@@* 1
.@@1 2
Configuration@@2 ?
.@@? @

GetSection@@@ J
(@@J K
$str@@K ]
)@@] ^
.@@^ _
Value@@_ d
)@@d e
;@@e f
jwtAA 
.AA 
	SaveTokenAA 
=AA 
trueAA 
;AA 
jwtCC 
.CC %
TokenValidationParametersCC %
=CC& '
newCC( +%
TokenValidationParametersCC, E
(CCE F
)CCF G
{DD 	$
ValidateIssuerSigningKeyEE $
=EE% &
trueEE' +
,EE+ ,
IssuerSigningKeyFF 
=FF 
newFF " 
SymmetricSecurityKeyFF# 7
(FF7 8
keyFF8 ;
)FF; <
,FF< =
ValidateIssuerGG 
=GG 
falseGG "
,GG" #
ValidateAudienceHH 
=HH 
falseHH $
,HH$ %!
RequireExpirationTimeII !
=II" #
falseII$ )
,II) *
ValidateLifetimeJJ 
=JJ 
trueJJ #
}KK 	
;KK	 

}LL 
)LL 
;LL 
builderNN 
.NN 
ServicesNN 
.NN 
AddAuthorizationNN !
(NN! "
)NN" #
;NN# $
varPP 
appPP 
=PP 	
builderPP
 
.PP 
BuildPP 
(PP 
)PP 
;PP 
ifSS 
(SS 
appSS 
.SS 
EnvironmentSS 
.SS 
IsDevelopmentSS !
(SS! "
)SS" #
)SS# $
{TT 
appUU 
.UU 

UseSwaggerUU 
(UU 
)UU 
;UU 
appVV 
.VV 
UseSwaggerUIVV 
(VV 
)VV 
;VV 
}WW 
appYY 
.YY 
UseHttpsRedirectionYY 
(YY 
)YY 
;YY 
app[[ 
.[[ 
UseAuthentication[[ 
([[ 
)[[ 
;[[ 
app\\ 
.\\ 
UseAuthorization\\ 
(\\ 
)\\ 
;\\ 
app^^ 
.^^ 
MapControllers^^ 
(^^ 
)^^ 
;^^ 
app`` 
.`` 
Run`` 
(`` 
)`` 	
;``	 
