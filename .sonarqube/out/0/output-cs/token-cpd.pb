ˆ
GE:\Work\Repos\EventEase\EventService\Consumers\ClientCreatedConsumer.cs
	namespace 	
EventService
 
. 
	Consumers  
{ 
public		 

class		 !
ClientCreatedConsumer		 &
:		' (
	IConsumer		) 2
<		2 3
ClientCreated		3 @
>		@ A
{

 
private 
readonly 
ILogger  
<  !
ClientCreated! .
>. /
_logger0 7
;7 8
private 
readonly 
IClientRepo $
_clientRepo% 0
;0 1
private 
readonly 
IMapper  
_mapper! (
;( )
public !
ClientCreatedConsumer $
($ %
ILogger% ,
<, -
ClientCreated- :
>: ;
logger< B
,B C
IClientRepoD O

clientRepoP Z
,Z [
IMapper\ c
mapperd j
)j k
{ 	
_logger 
= 
logger 
; 
_mapper 
= 
mapper 
; 
_clientRepo 
= 

clientRepo $
;$ %
} 	
public 
async 
Task 
Consume !
(! "
ConsumeContext" 0
<0 1
ClientCreated1 >
>> ?
context@ G
)G H
{ 	
var 
clientCreated 
= 
context  '
.' (
Message( /
;/ 0
_logger 
. 
LogInformation "
(" #
$"# %
$str% ;
{; <
clientCreated< I
.I J
NameJ N
}N O
"O P
)P Q
;Q R
var   
clientModel   
=   
_mapper   %
.  % &
Map  & )
<  ) *
Client  * 0
>  0 1
(  1 2
clientCreated  2 ?
)  ? @
;  @ A
_clientRepo"" 
."" 
CreateClient"" $
(""$ %
clientModel""% 0
)""0 1
;""1 2
await$$ 
_clientRepo$$ 
.$$ 
SaveChanges$$ )
($$) *
)$$* +
;$$+ ,
}%% 	
}&& 
}'' ä
GE:\Work\Repos\EventEase\EventService\Consumers\ClientDeletedConsumer.cs
	namespace 	
EventService
 
. 
	Consumers  
{ 
public 

class !
ClientDeletedConsumer &
:' (
	IConsumer) 2
<2 3
ClientDeleted3 @
>@ A
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
  !
ClientDeleted

! .
>

. /
_logger

0 7
;

7 8
private 
readonly 
IClientRepo $
_clientRepo% 0
;0 1
private 
readonly 
IMapper  
_mapper! (
;( )
public !
ClientDeletedConsumer $
($ %
ILogger% ,
<, -
ClientDeleted- :
>: ;
logger< B
,B C
IClientRepoD O

clientRepoP Z
,Z [
IMapper\ c
mapperd j
)j k
{ 	
_logger 
= 
logger 
; 
_mapper 
= 
mapper 
; 
_clientRepo 
= 

clientRepo $
;$ %
} 	
public 
async 
Task 
Consume !
(! "
ConsumeContext" 0
<0 1
ClientDeleted1 >
>> ?
context@ G
)G H
{ 	
var 
clientDeleted 
= 
context  '
.' (
Message( /
;/ 0
_logger 
. 
LogInformation "
(" #
$"# %
$str% ;
{; <
clientDeleted< I
.I J
IdJ L
}L M
"M N
)N O
;O P
var 
clientModel 
= 
await #
_clientRepo$ /
./ 0!
GetClientByExternalId0 E
(E F
clientDeletedF S
.S T
IdT V
)V W
;W X
_clientRepo!! 
.!! 
DeleteClient!! $
(!!$ %
clientModel!!% 0
)!!0 1
;!!1 2
await## 
_clientRepo## 
.## 
SaveChanges## )
(##) *
)##* +
;##+ ,
}$$ 	
}%% 
}&& †
GE:\Work\Repos\EventEase\EventService\Consumers\ClientUpdatedConsumer.cs
	namespace 	
EventService
 
. 
	Consumers  
{ 
public 

class !
ClientUpdatedConsumer &
:' (
	IConsumer) 2
<2 3
ClientUpdated3 @
>@ A
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
  !
ClientUpdated

! .
>

. /
_logger

0 7
;

7 8
private 
readonly 
IClientRepo $
_clientRepo% 0
;0 1
private 
readonly 
IMapper  
_mapper! (
;( )
public !
ClientUpdatedConsumer $
($ %
ILogger% ,
<, -
ClientUpdated- :
>: ;
logger< B
,B C
IClientRepoD O

clientRepoP Z
,Z [
IMapper\ c
mapperd j
)j k
{ 	
_logger 
= 
logger 
; 
_mapper 
= 
mapper 
; 
_clientRepo 
= 

clientRepo $
;$ %
} 	
public 
async 
Task 
Consume !
(! "
ConsumeContext" 0
<0 1
ClientUpdated1 >
>> ?
context@ G
)G H
{ 	
var 
clientUpdated 
= 
context  '
.' (
Message( /
;/ 0
_logger 
. 
LogInformation "
(" #
$"# %
$str% ;
{; <
clientUpdated< I
.I J
NameJ N
}N O
"O P
)P Q
;Q R
var 
clientModel 
= 
await #
_clientRepo$ /
./ 0!
GetClientByExternalId0 E
(E F
clientUpdatedF S
.S T
IdT V
)V W
;W X
clientModel!! 
.!! 
Name!! 
=!! 
clientUpdated!! ,
.!!, -
Name!!- 1
;!!1 2
_clientRepo## 
.## 
UpdateClient## $
(##$ %
clientModel##% 0
)##0 1
;##1 2
await%% 
_clientRepo%% 
.%% 
SaveChanges%% )
(%%) *
)%%* +
;%%+ ,
}&& 	
}'' 
}(( ‡
FE:\Work\Repos\EventEase\EventService\Consumers\VenueCreatedConsumer.cs
	namespace 	
EventService
 
. 
	Consumers  
{ 
public		 

class		  
VenueCreatedConsumer		 %
:		% &
	IConsumer		' 0
<		0 1
VenueCreated		1 =
>		= >
{

 
private 
readonly 
ILogger  
<  !
VenueCreated! -
>- .
_logger/ 6
;6 7
private 
readonly 

IVenueRepo #

_venueRepo$ .
;. /
private 
readonly 
IMapper  
_mapper! (
;( )
public  
VenueCreatedConsumer #
(# $
ILogger$ +
<+ ,
VenueCreated, 8
>8 9
logger: @
,@ A

IVenueRepoB L
	venueRepoM V
,V W
IMapperX _
mapper` f
)f g
{ 	
_logger 
= 
logger 
; 
_mapper 
= 
mapper 
; 

_venueRepo 
= 
	venueRepo "
;" #
} 	
public 
async 
Task 
Consume !
(! "
ConsumeContext" 0
<0 1
VenueCreated1 =
>= >
context? F
)F G
{ 	
var 
venueCreated 
= 
context &
.& '
Message' .
;. /
_logger 
. 
LogInformation "
(" #
$"# %
$str% ;
{; <
venueCreated< H
.H I
NameI M
}M N
"N O
)O P
;P Q
var   

venueModel   
=   
_mapper   $
.  $ %
Map  % (
<  ( )
Venue  ) .
>  . /
(  / 0
venueCreated  0 <
)  < =
;  = >

_venueRepo"" 
."" 
CreateVenue"" "
(""" #

venueModel""# -
)""- .
;"". /
await$$ 

_venueRepo$$ 
.$$ 
SaveChanges$$ (
($$( )
)$$) *
;$$* +
}%% 	
}&& 
}'' Û
FE:\Work\Repos\EventEase\EventService\Consumers\VenueDeletedConsumer.cs
	namespace 	
EventService
 
. 
	Consumers  
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
private 
readonly 

IVenueRepo #

_venueRepo$ .
;. /
private 
readonly 
IMapper  
_mapper! (
;( )
public  
VenueDeletedConsumer #
(# $
ILogger$ +
<+ ,
VenueDeleted, 8
>8 9
logger: @
,@ A

IVenueRepoB L
	venueRepoM V
,V W
IMapperX _
mapper` f
)f g
{ 	
_logger 
= 
logger 
; 
_mapper 
= 
mapper 
; 

_venueRepo 
= 
	venueRepo "
;" #
} 	
public 
async 
Task 
Consume !
(! "
ConsumeContext" 0
<0 1
VenueDeleted1 =
>= >
context? F
)F G
{ 	
var 
venueDeleted 
= 
context &
.& '
Message' .
;. /
_logger 
. 
LogInformation "
(" #
$"# %
$str% ;
{; <
venueDeleted< H
.H I
IdI K
}K L
"L M
)M N
;N O
var 

venueModel 
= 
await "

_venueRepo# -
.- . 
GetVenueByExternalId. B
(B C
venueDeletedC O
.O P
IdP R
)R S
;S T

_venueRepo!! 
.!! 
DeleteVenue!! "
(!!" #

venueModel!!# -
)!!- .
;!!. /
await## 

_venueRepo## 
.## 
SaveChanges## (
(##( )
)##) *
;##* +
}$$ 	
}%% 
}&& á
FE:\Work\Repos\EventEase\EventService\Consumers\VenueUpdatedConsumer.cs
	namespace 	
EventService
 
. 
	Consumers  
{ 
public 

class  
VenueUpdatedConsumer %
:% &
	IConsumer' 0
<0 1
VenueUpdated1 =
>= >
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
VenueUpdated
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
private 
readonly 

IVenueRepo #

_venueRepo$ .
;. /
private 
readonly 
IMapper  
_mapper! (
;( )
public  
VenueUpdatedConsumer #
(# $
ILogger$ +
<+ ,
VenueUpdated, 8
>8 9
logger: @
,@ A

IVenueRepoB L
	venueRepoM V
,V W
IMapperX _
mapper` f
)f g
{ 	
_logger 
= 
logger 
; 
_mapper 
= 
mapper 
; 

_venueRepo 
= 
	venueRepo "
;" #
} 	
public 
async 
Task 
Consume !
(! "
ConsumeContext" 0
<0 1
VenueUpdated1 =
>= >
context? F
)F G
{ 	
var 
venueUpdated 
= 
context &
.& '
Message' .
;. /
_logger 
. 
LogInformation "
(" #
$"# %
$str% ;
{; <
venueUpdated< H
.H I
NameI M
}M N
"N O
)O P
;P Q
var 

venueModel 
= 
await "

_venueRepo# -
.- . 
GetVenueByExternalId. B
(B C
venueUpdatedC O
.O P
IdP R
)R S
;S T

venueModel!! 
.!! 
Name!! 
=!! 
venueUpdated!! *
.!!* +
Name!!+ /
;!!/ 0

_venueRepo## 
.## 
UpdateVenue## "
(##" #

venueModel### -
)##- .
;##. /
await%% 

_venueRepo%% 
.%% 
SaveChanges%% (
(%%( )
)%%) *
;%%* +
}&& 	
}'' 
}((  
EE:\Work\Repos\EventEase\EventService\Controllers\ClientsController.cs
	namespace		 	
EventService		
 
.		 
Controllers		 "
{

 
[ 
Route 

(
 
$str $
)$ %
]% &
[ 
ApiController 
] 
public 

class 
ClientsController "
:" #

Controller$ .
{ 
private 
readonly 
IClientRepo $
_clientRepo% 0
;0 1
private 
readonly 
IMapper  
_mapper! (
;( )
public 
ClientsController  
(  !
IClientRepo! ,

clientRepo- 7
,7 8
IMapper9 @
mapperA G
)G H
{ 	
_clientRepo 
= 

clientRepo $
;$ %
_mapper 
= 
mapper 
; 
} 	
[ 	
HttpGet	 
( 
$str 
, 
Name 
= 
$str  /
)/ 0
]0 1
[ 	
	Authorize	 
] 
public 
async 
Task 
< 
ActionResult &
<& '
ClientReadDto' 4
>4 5
>5 6
GetClientById7 D
(D E
intE H
idI K
)K L
{ 	
Console 
. 
	WriteLine 
( 
$str =
+> ?
id@ B
)B C
;C D
string 
clientId 
= 
this "
." #
User# '
.' (
GetId( -
(- .
). /
;/ 0
var!! 
client!! 
=!! 
await!! 
_clientRepo!! *
.!!* +
GetClientById!!+ 8
(!!8 9
id!!9 ;
)!!; <
;!!< =
Console"" 
."" 
	WriteLine"" 
("" 
$str"" (
)""( )
;"") *
Console## 
.## 
	WriteLine## 
(## 
clientId## &
)##& '
;##' (
Console$$ 
.$$ 
	WriteLine$$ 
($$ 
$str$$ 1
)$$1 2
;$$2 3
Console%% 
.%% 
	WriteLine%% 
(%% 
client%% $
.%%$ %

ExternalId%%% /
)%%/ 0
;%%0 1
if'' 
('' 
client'' 
is'' 
null'' 
)'' 
{(( 
return)) 
NotFound)) 
())  
$"))  "
$str))" ;
")); <
)))< =
;))= >
}** 
if,, 
(,, 
clientId,, 
!=,, 
client,, "
.,," #

ExternalId,,# -
),,- .
{-- 
return.. 
Unauthorized.. #
(..# $
)..$ %
;..% &
}// 
return11 
Ok11 
(11 
_mapper11 
.11 
Map11 !
<11! "
ClientReadDto11" /
>11/ 0
(110 1
client111 7
)117 8
)118 9
;119 :
}22 	
}33 
}44 „ì
DE:\Work\Repos\EventEase\EventService\Controllers\EventsController.cs
	namespace 	
EventService
 
. 
Controllers "
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
EventsController !
:" #

Controller$ .
{ 
private 
readonly 

IEventRepo #

_eventRepo$ .
;. /
private 
readonly 
IClientRepo $
_clientRepo% 0
;0 1
private 
readonly 

IVenueRepo #

_venueRepo$ .
;. /
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
IPublishEndpoint )
_publishEndpoint* :
;: ;
public 
EventsController 
(  

IEventRepo  *
	eventRepo+ 4
,4 5

IVenueRepo6 @
	venueRepoA J
,J K
IClientRepoL W

clientRepoX b
,b c
IMapperd k
mapperl r
,r s
IPublishEndpoint	t Ñ
publishEndpoint
Ö î
)
î ï
{ 	

_eventRepo 
= 
	eventRepo "
;" #
_clientRepo 
= 

clientRepo $
;$ %

_venueRepo 
= 
	venueRepo "
;" #
_mapper 
= 
mapper 
; 
_publishEndpoint 
= 
publishEndpoint .
;. /
} 	
[!! 	
HttpGet!!	 
]!! 
["" 	
	Authorize""	 
("" !
AuthenticationSchemes"" (
="") *
JwtBearerDefaults""+ <
.""< = 
AuthenticationScheme""= Q
,""Q R
Roles""S X
=""Y Z
$str""[ b
)""b c
]""c d
public## 
async## 
Task## 
<## 
ActionResult## &
<##& '
IEnumerable##' 2
<##2 3
EventReadDto##3 ?
>##? @
>##@ A
>##A B
GetAllEvents##C O
(##O P
int##P S
pageSize##T \
=##] ^
$num##_ a
,##a b
int##c f

pageNumber##g q
=##r s
$num##t u
)##u v
{$$ 	
Console%% 
.%% 
	WriteLine%% 
(%% 
$str%% 7
)%%7 8
;%%8 9
var'' 
events'' 
='' 
await'' 

_eventRepo'' )
.'') *
GetAllEvents''* 6
(''6 7
pageSize''7 ?
,''? @

pageNumber''A K
)''K L
;''L M
return)) 
Ok)) 
()) 
_mapper)) 
.)) 
Map)) !
<))! "
IEnumerable))" -
<))- .
EventReadDto)). :
>)): ;
>)); <
())< =
events))= C
)))C D
)))D E
;))E F
}** 	
[,, 	
HttpGet,,	 
(,, 
$str,, 
,,, 
Name,, 
=,, 
$str,,  .
),,. /
],,/ 0
public-- 
async-- 
Task-- 
<-- 
ActionResult-- &
<--& '
EventReadDto--' 3
>--3 4
>--4 5
GetEventById--6 B
(--B C
int--C F
id--G I
)--I J
{.. 	
Console// 
.// 
	WriteLine// 
(// 
$str// <
+//= >
id//? A
)//A B
;//B C
var11 
ev11 
=11 
await11 

_eventRepo11 %
.11% &
GetEventById11& 2
(112 3
id113 5
)115 6
;116 7
if33 
(33 
ev33 
is33 
null33 
)33 
{44 
return55 
NotFound55 
(55  
$str55  ;
)55; <
;55< =
}66 
return88 
Ok88 
(88 
_mapper88 
.88 
Map88 !
<88! "
EventReadDto88" .
>88. /
(88/ 0
ev880 2
)882 3
)883 4
;884 5
}99 	
[;; 	
HttpPost;;	 
];; 
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
<== 
ActionResult== &
<==& '
EventReadDto==' 3
>==3 4
>==4 5
CreateEvent==6 A
(==A B
EventCreateDto==B P
eventCreateDto==Q _
)==_ `
{>> 	
if?? 
(?? 

ModelState?? 
.?? 
IsValid?? "
)??" #
{@@ 
stringBB 
venueIdBB 
=BB  
thisBB! %
.BB% &
UserBB& *
.BB* +
GetIdBB+ 0
(BB0 1
)BB1 2
;BB2 3
varDD 
venueDD 
=DD 
awaitDD !

_venueRepoDD" ,
.DD, -
GetVenueByIdDD- 9
(DD9 :
eventCreateDtoDD: H
.DDH I
VenueIdDDI P
)DDP Q
;DDQ R
ifFF 
(FF 
venueFF 
isFF 
nullFF  
)FF  !
{GG 
returnHH 
NotFoundHH #
(HH# $
$"HH$ &
$strHH& >
"HH> ?
)HH? @
;HH@ A
}II 
ifLL 
(LL 
venueIdLL 
!=LL 
venueLL $
.LL$ %

ExternalIdLL% /
)LL/ 0
{MM 
returnNN 
UnauthorizedNN '
(NN' (
)NN( )
;NN) *
}OO 
varQQ 
newEventQQ 
=QQ 
_mapperQQ &
.QQ& '
MapQQ' *
<QQ* +
ModelsQQ+ 1
.QQ1 2
EventQQ2 7
>QQ7 8
(QQ8 9
eventCreateDtoQQ9 G
)QQG H
;QQH I

_eventRepoSS 
.SS 
CreateEventSS &
(SS& '
newEventSS' /
)SS/ 0
;SS0 1
ifVV 
(VV 
awaitVV 

_eventRepoVV $
.VV$ %
SaveChangesVV% 0
(VV0 1
)VV1 2
)VV2 3
{WW 
varXX 
eventCreatedXX $
=XX% &
_mapperXX' .
.XX. /
MapXX/ 2
<XX2 3
EventCreatedXX3 ?
>XX? @
(XX@ A
newEventXXA I
)XXI J
;XXJ K
varYY 

eventVenueYY "
=YY# $
_mapperYY% ,
.YY, -
MapYY- 0
<YY0 1
MessageBusEventsYY1 A
.YYA B
ModelsYYB H
.YYH I
DtoYYI L
.YYL M
VenueYYM R
>YYR S
(YYS T
newEventYYT \
.YY\ ]
VenueYY] b
)YYb c
;YYc d
eventCreated[[  
.[[  !
Venue[[! &
=[[' (

eventVenue[[) 3
;[[3 4
await]] 
_publishEndpoint]] *
.]]* +
Publish]]+ 2
<]]2 3
EventCreated]]3 ?
>]]? @
(]]@ A
eventCreated]]A M
)]]M N
;]]N O
}^^ 
var`` 
eventReadDto``  
=``! "
_mapper``# *
.``* +
Map``+ .
<``. /
EventReadDto``/ ;
>``; <
(``< =
newEvent``= E
)``E F
;``F G
returnbb 
CreatedAtRoutebb %
(bb% &
nameofbb& ,
(bb, -
GetEventByIdbb- 9
)bb9 :
,bb: ;
newbb< ?
{bb@ A
IdbbB D
=bbE F
eventReadDtobbG S
.bbS T
IdbbT V
}bbW X
,bbX Y
eventReadDtobbZ f
)bbf g
;bbg h
}cc 
returnee 

BadRequestee 
(ee 
$stree 7
)ee7 8
;ee8 9
}ff 	
[hh 	
HttpPuthh	 
(hh 
$strhh 
)hh 
]hh 
[ii 	
	Authorizeii	 
(ii !
AuthenticationSchemesii (
=ii) *
JwtBearerDefaultsii+ <
.ii< = 
AuthenticationSchemeii= Q
,iiQ R
RolesiiS X
=iiY Z
$strii[ b
)iib c
]iic d
publicjj 
asyncjj 
Taskjj 
<jj 
ActionResultjj &
<jj& '
EventUpdateDtojj' 5
>jj5 6
>jj6 7
UpdateEventjj8 C
(jjC D
intjjD G
idjjH J
,jjJ K
EventUpdateDtojjL Z
eventUpdateDtojj[ i
)jji j
{kk 	
stringmm 
venueIdmm 
=mm 
thismm !
.mm! "
Usermm" &
.mm& '
GetIdmm' ,
(mm, -
)mm- .
;mm. /
varoo 

eventModeloo 
=oo 
awaitoo "

_eventRepooo# -
.oo- .
GetEventByIdoo. :
(oo: ;
idoo; =
)oo= >
;oo> ?
ifqq 
(qq 

eventModelqq 
isqq 
nullqq "
)qq" #
{rr 
returnss 
NotFoundss 
(ss  
$"ss  "
$strss" ;
"ss; <
)ss< =
;ss= >
}tt 
ifww 
(ww 
venueIdww 
!=ww 

eventModelww %
.ww% &
Venueww& +
.ww+ ,

ExternalIdww, 6
)ww6 7
{xx 
returnyy 
Unauthorizedyy #
(yy# $
)yy$ %
;yy% &
}zz 

eventModel}} 
.}} 
Name}} 
=}} 
eventUpdateDto}} ,
.}}, -
Name}}- 1
;}}1 2

eventModel~~ 
.~~ 
Type~~ 
=~~ 
eventUpdateDto~~ ,
.~~, -
Type~~- 1
;~~1 2

eventModel 
. 
Artist 
= 
eventUpdateDto  .
.. /
Artist/ 5
;5 6

eventModel
ÄÄ 
.
ÄÄ 
Description
ÄÄ "
=
ÄÄ# $
eventUpdateDto
ÄÄ% 3
.
ÄÄ3 4
Description
ÄÄ4 ?
;
ÄÄ? @

_eventRepo
ÇÇ 
.
ÇÇ 
UpdateEvent
ÇÇ "
(
ÇÇ" #

eventModel
ÇÇ# -
)
ÇÇ- .
;
ÇÇ. /
if
ÖÖ 
(
ÖÖ 
await
ÖÖ 

_eventRepo
ÖÖ  
.
ÖÖ  !
SaveChanges
ÖÖ! ,
(
ÖÖ, -
)
ÖÖ- .
)
ÖÖ. /
{
ÜÜ 
var
áá 
eventUpdated
áá  
=
áá! "
_mapper
áá# *
.
áá* +
Map
áá+ .
<
áá. /
EventUpdated
áá/ ;
>
áá; <
(
áá< =

eventModel
áá= G
)
ááG H
;
ááH I
await
ââ 
_publishEndpoint
ââ &
.
ââ& '
Publish
ââ' .
<
ââ. /
EventUpdated
ââ/ ;
>
ââ; <
(
ââ< =
eventUpdated
ââ= I
)
ââI J
;
ââJ K
}
ää 
return
åå 
	NoContent
åå 
(
åå 
)
åå 
;
åå 
}
çç 	
[
èè 	

HttpDelete
èè	 
(
èè 
$str
èè 
)
èè 
]
èè 
[
êê 	
	Authorize
êê	 
(
êê #
AuthenticationSchemes
êê (
=
êê) *
JwtBearerDefaults
êê+ <
.
êê< ="
AuthenticationScheme
êê= Q
,
êêQ R
Roles
êêS X
=
êêY Z
$str
êê[ b
)
êêb c
]
êêc d
public
ëë 
async
ëë 
Task
ëë 
<
ëë 
ActionResult
ëë &
>
ëë& '
DeleteEvent
ëë( 3
(
ëë3 4
int
ëë4 7
id
ëë8 :
)
ëë: ;
{
íí 	
string
îî 
venueId
îî 
=
îî 
this
îî !
.
îî! "
User
îî" &
.
îî& '
GetId
îî' ,
(
îî, -
)
îî- .
;
îî. /
var
ññ 

eventModel
ññ 
=
ññ 
await
ññ "

_eventRepo
ññ# -
.
ññ- .
GetEventById
ññ. :
(
ññ: ;
id
ññ; =
)
ññ= >
;
ññ> ?
if
òò 
(
òò 

eventModel
òò 
is
òò 
null
òò "
)
òò" #
{
ôô 
return
öö 
NotFound
öö 
(
öö  
$"
öö  "
$str
öö" ;
"
öö; <
)
öö< =
;
öö= >
}
õõ 
if
ûû 
(
ûû 
venueId
ûû 
!=
ûû 

eventModel
ûû %
.
ûû% &
Venue
ûû& +
.
ûû+ ,

ExternalId
ûû, 6
)
ûû6 7
{
üü 
return
†† 
Unauthorized
†† #
(
††# $
)
††$ %
;
††% &
}
°° 

_eventRepo
££ 
.
££ 
DeleteEvent
££ "
(
££" #

eventModel
££# -
)
££- .
;
££. /
if
¶¶ 
(
¶¶ 
await
¶¶ 

_eventRepo
¶¶  
.
¶¶  !
SaveChanges
¶¶! ,
(
¶¶, -
)
¶¶- .
)
¶¶. /
{
ßß 
var
®® 
eventDeleted
®®  
=
®®! "
_mapper
®®# *
.
®®* +
Map
®®+ .
<
®®. /
EventDeleted
®®/ ;
>
®®; <
(
®®< =

eventModel
®®= G
)
®®G H
;
®®H I
await
™™ 
_publishEndpoint
™™ &
.
™™& '
Publish
™™' .
<
™™. /
EventDeleted
™™/ ;
>
™™; <
(
™™< =
eventDeleted
™™= I
)
™™I J
;
™™J K
}
´´ 
return
≠≠ 
Ok
≠≠ 
(
≠≠ 
)
≠≠ 
;
≠≠ 
}
ÆÆ 	
[
∞∞ 	
HttpPost
∞∞	 
(
∞∞ 
$str
∞∞ '
)
∞∞' (
]
∞∞( )
[
±± 	
	Authorize
±±	 
(
±± #
AuthenticationSchemes
±± (
=
±±) *
JwtBearerDefaults
±±+ <
.
±±< ="
AuthenticationScheme
±±= Q
,
±±Q R
Roles
±±S X
=
±±Y Z
$str
±±[ c
)
±±c d
]
±±d e
public
≤≤ 
async
≤≤ 
Task
≤≤ 
<
≤≤ 
ActionResult
≤≤ &
>
≤≤& '
ReserveTicket
≤≤( 5
(
≤≤5 6
int
≤≤6 9
id
≤≤: <
,
≤≤< ="
ClientEventCreateDto
≤≤> R"
clientEventCreateDto
≤≤S g
)
≤≤g h
{
≥≥ 	
string
µµ 
clientId
µµ 
=
µµ 
this
µµ "
.
µµ" #
User
µµ# '
.
µµ' (
GetId
µµ( -
(
µµ- .
)
µµ. /
;
µµ/ 0
var
∑∑ 
client
∑∑ 
=
∑∑ 
await
∑∑ 
_clientRepo
∑∑ *
.
∑∑* +#
GetClientByExternalId
∑∑+ @
(
∑∑@ A
clientId
∑∑A I
)
∑∑I J
;
∑∑J K
if
ππ 
(
ππ 
clientId
ππ 
!=
ππ 
client
ππ !
.
ππ! "

ExternalId
ππ" ,
)
ππ, -
{
ππ. /
return
∫∫ 
Unauthorized
∫∫ #
(
∫∫# $
)
∫∫$ %
;
∫∫% &
}
ªª 
var
ΩΩ 

eventModel
ΩΩ 
=
ΩΩ 
await
ΩΩ "

_eventRepo
ΩΩ# -
.
ΩΩ- .
GetEventById
ΩΩ. :
(
ΩΩ: ;
id
ΩΩ; =
)
ΩΩ= >
;
ΩΩ> ?
if
øø 
(
øø 

eventModel
øø 
is
øø 
null
øø !
)
øø! "
{
¿¿ 
NotFound
¡¡ 
(
¡¡ 
$"
¡¡ 
$str
¡¡ 4
"
¡¡4 5
)
¡¡5 6
;
¡¡6 7
}
¬¬ 
var
ƒƒ 
clientEvent
ƒƒ 
=
ƒƒ 
new
ƒƒ !
ClientEvent
ƒƒ" -
(
ƒƒ- .
)
ƒƒ. /
{
ƒƒ0 1

TicketsNum
≈≈ 
=
≈≈ "
clientEventCreateDto
≈≈ 1
.
≈≈1 2

TicketsNum
≈≈2 <
,
≈≈< =
Event
∆∆ 
=
∆∆ 

eventModel
∆∆ "
,
∆∆" #
Client
«« 
=
«« 
client
«« 
}
»» 
;
»» 

_eventRepo
ÀÀ 
.
ÀÀ 
ReserveTickets
ÀÀ %
(
ÀÀ% &
clientEvent
ÀÀ& 1
)
ÀÀ1 2
;
ÀÀ2 3
if
ŒŒ 
(
ŒŒ 

eventModel
ŒŒ 
.
ŒŒ 
TotalTickets
ŒŒ &
!=
ŒŒ' )

eventModel
ŒŒ* 4
.
ŒŒ4 5
RemainingTickets
ŒŒ5 E
)
ŒŒE F
{
œœ 

eventModel
–– 
.
–– 
RemainingTickets
–– +
=
––, -

eventModel
––. 8
.
––8 9
RemainingTickets
––9 I
-
––J K"
clientEventCreateDto
––L `
.
––` a

TicketsNum
––a k
;
––k l
}
—— 
else
““ 
{
”” 

eventModel
‘‘ 
.
‘‘ 
RemainingTickets
‘‘ +
=
‘‘, -

eventModel
‘‘. 8
.
‘‘8 9
TotalTickets
‘‘9 E
-
‘‘F G"
clientEventCreateDto
‘‘H \
.
‘‘\ ]

TicketsNum
‘‘] g
;
‘‘g h
}
’’ 

_eventRepo
◊◊ 
.
◊◊ 
UpdateEvent
◊◊ "
(
◊◊" #

eventModel
◊◊# -
)
◊◊- .
;
◊◊. /
if
⁄⁄ 
(
⁄⁄ 
await
⁄⁄ 

_eventRepo
⁄⁄  
.
⁄⁄  !
SaveChanges
⁄⁄! ,
(
⁄⁄, -
)
⁄⁄- .
)
⁄⁄. /
{
€€ 
var
‹‹ 
eventUpdated
‹‹  
=
‹‹! "
_mapper
‹‹# *
.
‹‹* +
Map
‹‹+ .
<
‹‹. /
EventUpdated
‹‹/ ;
>
‹‹; <
(
‹‹< =

eventModel
‹‹= G
)
‹‹G H
;
‹‹H I
await
ﬁﬁ 
_publishEndpoint
ﬁﬁ &
.
ﬁﬁ& '
Publish
ﬁﬁ' .
<
ﬁﬁ. /
EventUpdated
ﬁﬁ/ ;
>
ﬁﬁ; <
(
ﬁﬁ< =
eventUpdated
ﬁﬁ= I
)
ﬁﬁI J
;
ﬁﬁJ K
}
ﬂﬂ 
return
·· 
Ok
·· 
(
·· 
)
·· 
;
·· 
}
‚‚ 	
}
„„ 
}‰‰ £
DE:\Work\Repos\EventEase\EventService\Controllers\VenuesController.cs
	namespace 	
EventService
 
. 
Controllers "
{ 
[ 
Route 

(
 
$str $
)$ %
]% &
[		 
ApiController		 
]		 
public

 

class

 
VenuesController

 !
:

! "

Controller

# -
{ 
private 
readonly 

IVenueRepo #

_venueRepo$ .
;. /
private 
readonly 
IMapper  
_mapper! (
;( )
public 
VenuesController 
(  

IVenueRepo  *
	venueRepo+ 4
,4 5
IMapper6 =
mapper> D
)D E
{ 	

_venueRepo 
= 
	venueRepo "
;" #
_mapper 
= 
mapper 
; 
} 	
[ 	
HttpGet	 
( 
$str 
, 
Name 
= 
$str  .
). /
]/ 0
public 
async 
Task 
< 
ActionResult &
<& '
VenueReadDto' 3
>3 4
>4 5
GetVenueById6 B
(B C
intC F
idG I
)I J
{ 	
Console 
. 
	WriteLine 
( 
$str <
+= >
id? A
)A B
;B C
var 
venue 
= 
await 

_venueRepo (
.( )
GetVenueById) 5
(5 6
id6 8
)8 9
;9 :
return 
Ok 
( 
_mapper 
. 
Map !
<! "
VenueReadDto" .
>. /
(/ 0
venue0 5
)5 6
)6 7
;7 8
} 	
} 
} —
9E:\Work\Repos\EventEase\EventService\Data\AppDbContext.cs
	namespace 	
EventService
 
. 
Data 
{ 
public 

class 
AppDbContext 
: 
	DbContext  )
{ 
public 
AppDbContext 
( 
DbContextOptions ,
<, -
AppDbContext- 9
>9 :
opt; >
)> ?
:@ A
baseB F
(F G
optG J
)J K
{		 	
} 	
public 
DbSet 
< 
Event 
> 
Events "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
DbSet 
< 
Venue 
> 
Venues "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
DbSet 
< 
Client 
> 
Clients $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
DbSet 
< 
ClientEvent  
>  !
ClientEvents" .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{ 	
modelBuilder 
. 
Entity 
< 
Venue 
> 
( 
)  
. 
HasMany 
( 
v 
=> 
v 
.  
Events  &
)& '
. 
WithOne 
( 
e 
=> 
e 
.  
Venue  %
)% &
. 
HasForeignKey 
( 
e  
=>! #
e$ %
.% &
VenueId& -
)- .
;. /
modelBuilder 
. 
Entity 
< 
Event 
> 
( 
)  
. 
HasOne 
( 
e 
=> 
e 
. 
Venue $
)$ %
. 
WithMany 
( 
v 
=> 
v  
.  !
Events! '
!' (
)( )
. 
HasForeignKey 
( 
e  
=>! #
e$ %
.% &
VenueId& -
)- .
;. /
modelBuilder33 
.33 
Entity33 
<33  
Client33  &
>33& '
(33' (
)33( )
.44 
HasMany44 
(44 
c44 
=>44 
c44 
.44  
Events44  &
)44& '
.55 
WithMany55 
(55 
e55 
=>55 
e55  
.55  !
Clients55! (
)55( )
.66 
UsingEntity66 
<66 
ClientEvent66 (
>66( )
(66) *
)66* +
;66+ ,
}77 	
}99 
}:: Í$
7E:\Work\Repos\EventEase\EventService\Data\ClientRepo.cs
	namespace 	
EventService
 
. 
Data 
{ 
public 

class 

ClientRepo 
: 
IClientRepo )
{ 
private 
readonly 
AppDbContext %
_context& .
;. /
public

 

ClientRepo

 
(

 
AppDbContext

 &
context

' .
)

. /
{ 	
_context 
= 
context 
; 
} 	
public 
void 
CreateClient  
(  !
Client! '
client( .
). /
{ 	
if 
( 
client 
is 
null 
) 
{ 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
client7 =
)= >
)> ?
;? @
} 
_context 
. 
Clients 
. 
Add  
(  !
client! '
)' (
;( )
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Client& ,
>, -
>- .
GetAllClients/ <
(< =
)= >
{ 	
return 
await 
_context !
.! "
Clients" )
.) *
ToListAsync* 5
(5 6
)6 7
;7 8
} 	
public 
async 
Task 
< 
Client  
>  !
GetClientById" /
(/ 0
int0 3
id4 6
)6 7
{ 	
return   
await   
_context   !
.  ! "
Clients  " )
.!! 
Where!! 
(!! 
c!! 
=>!! 
c!! 
.!! 
Id!!  
==!!! #
id!!$ &
)!!& '
."" 
Include"" 
("" 
c"" 
=>"" 
c"" 
.""  
Events""  &
)""& '
.## 
ThenInclude##  
(##  !
e##! "
=>### %
e##& '
.##' (
Venue##( -
)##- .
.$$ 
FirstOrDefaultAsync$$ $
($$$ %
)$$% &
;$$& '
}%% 	
public'' 
async'' 
Task'' 
<'' 
Client''  
>''  !
GetClientByEmail''" 2
(''2 3
string''3 9
email'': ?
)''? @
{(( 	
return)) 
await)) 
_context)) !
.))! "
Clients))" )
.))) *
FirstOrDefaultAsync))* =
())= >
c))> ?
=>))@ B
c))C D
.))D E
Email))E J
==))K M
email))N S
)))S T
;))T U
}** 	
public,, 
async,, 
Task,, 
<,, 
bool,, 
>,, 
SaveChanges,,  +
(,,+ ,
),,, -
{-- 	
return.. 
(.. 
await.. 
_context.. "
..." #
SaveChangesAsync..# 3
(..3 4
)..4 5
>=..6 8
$num..9 :
)..: ;
;..; <
}// 	
public11 
void11 
UpdateClient11  
(11  !
Client11! '
client11( .
)11. /
{22 	
_context33 
.33 
Clients33 
.33 
Update33 #
(33# $
client33$ *
)33* +
;33+ ,
}44 	
public66 
void66 
DeleteClient66  
(66  !
Client66! '
client66( .
)66. /
{77 	
_context88 
.88 
Clients88 
.88 
Remove88 #
(88# $
client88$ *
)88* +
;88+ ,
}99 	
public;; 
async;; 
Task;; 
<;; 
Client;;  
>;;  !!
GetClientByExternalId;;" 7
(;;7 8
string;;8 >
id;;? A
);;A B
{<< 	
return== 
await== 
_context== !
.==! "
Clients==" )
.==) *
FirstOrDefaultAsync==* =
(=== >
c==> ?
=>==@ B
c==C D
.==D E

ExternalId==E O
====P R
id==S U
)==U V
;==V W
}>> 	
}?? 
}@@ ˘%
6E:\Work\Repos\EventEase\EventService\Data\EventRepo.cs
	namespace 	
EventService
 
. 
Data 
{ 
public 

class 
	EventRepo 
: 

IEventRepo '
{ 
private 
readonly 
AppDbContext %
_context& .
;. /
public

 
	EventRepo

 
(

 
AppDbContext

 %
context

& -
)

- .
{ 	
_context 
= 
context 
; 
} 	
public 
void 
CreateEvent 
(  
Event  %
createdEvent& 2
)2 3
{ 	
if 
( 
createdEvent 
is 
null #
)# $
{ 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
createdEvent7 C
)C D
)D E
;E F
} 
_context 
. 
Events 
. 
Add 
(  
createdEvent  ,
), -
;- .
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Event& +
>+ ,
>, -
GetAllEvents. :
(: ;
int; >
pageSize? G
,G H
intI L

pageNumberM W
)W X
{ 	
if 
( 
pageSize 
> 
$num 
) 
{ 
pageSize 
= 
$num 
; 
} 
return 
await 
_context !
.! "
Events" (
.   
Include   
(   
e   
=>   
e   
.    
Venue    %
)  % &
.!! 
Include!! 
(!! 
e!! 
=>!! 
e!! 
.!!  
Clients!!  '
)!!' (
."" 
Skip"" 
("" 
("" 

pageNumber"" !
-""" #
$num""$ %
)""% &
*""' (
pageSize"") 1
)""1 2
.## 
Take## 
(## 
pageSize## 
)## 
.$$ 
ToListAsync$$ 
($$ 
)$$ 
;$$ 
}%% 	
public'' 
async'' 
Task'' 
<'' 
Event'' 
>''  
GetEventById''! -
(''- .
int''. 1
id''2 4
)''4 5
{(( 	
return)) 
await)) 
_context)) !
.))! "
Events))" (
.** 
Where** 
(** 
e** 
=>** 
e** 
.** 
Id**  
==**! #
id**$ &
)**& '
.++ 
Include++ 
(++ 
e++ 
=>++ 
e++ 
.++  
Venue++  %
)++% &
.,, 
Include,, 
(,, 
e,, 
=>,, 
e,, 
.,,  
Clients,,  '
),,' (
.-- 
FirstOrDefaultAsync-- $
(--$ %
)--% &
;--& '
}.. 	
public00 
async00 
Task00 
<00 
bool00 
>00 
SaveChanges00  +
(00+ ,
)00, -
{11 	
return22 
(22 
await22 
_context22 "
.22" #
SaveChangesAsync22# 3
(223 4
)224 5
>=226 8
$num229 :
)22: ;
;22; <
}33 	
public55 
void55 
UpdateEvent55 
(55  
Event55  %
updatedEvent55& 2
)552 3
{66 	
_context77 
.77 
Events77 
.77 
Update77 "
(77" #
updatedEvent77# /
)77/ 0
;770 1
}88 	
public:: 
void:: 
DeleteEvent:: 
(::  
Event::  %
deletedEvent::& 2
)::2 3
{;; 	
_context<< 
.<< 
Events<< 
.<< 
Remove<< "
(<<" #
deletedEvent<<# /
)<</ 0
;<<0 1
}== 	
public?? 
void?? 
ReserveTickets?? "
(??" #
ClientEvent??# .
clientEvent??/ :
)??: ;
{@@ 	
_contextAA 
.AA 
ClientEventsAA !
.AA! "
AddAA" %
(AA% &
clientEventAA& 1
)AA1 2
;AA2 3
}BB 	
}CC 
}DD Ô
8E:\Work\Repos\EventEase\EventService\Data\IClientRepo.cs
	namespace 	
EventService
 
. 
Data 
{ 
public 

	interface 
IClientRepo  
{ 
Task 
< 
bool 
> 
SaveChanges 
( 
)  
;  !
Task		 
<		 
IEnumerable		 
<		 
Client		 
>		  
>		  !
GetAllClients		" /
(		/ 0
)		0 1
;		1 2
Task 
< 
Client 
> 
GetClientById "
(" #
int# &
id' )
)) *
;* +
Task 
< 
Client 
> !
GetClientByExternalId *
(* +
string+ 1
id2 4
)4 5
;5 6
Task 
< 
Client 
> 
GetClientByEmail %
(% &
string& ,
email- 2
)2 3
;3 4
void 
CreateClient 
( 
Client  
client! '
)' (
;( )
void 
UpdateClient 
( 
Client  
client! '
)' (
;( )
void 
DeleteClient 
( 
Client  
client! '
)' (
;( )
} 
} ·

7E:\Work\Repos\EventEase\EventService\Data\IEventRepo.cs
	namespace 	
EventService
 
. 
Data 
{ 
public 

	interface 

IEventRepo 
{ 
Task 
< 
bool 
> 
SaveChanges 
( 
)  
;  !
Task		 
<		 
IEnumerable		 
<		 
Event		 
>		 
>		  
GetAllEvents		! -
(		- .
int		. 1
pageSize		2 :
,		: ;
int		< ?

pageNumber		@ J
)		J K
;		K L
Task 
< 
Event 
> 
GetEventById  
(  !
int! $
id% '
)' (
;( )
void 
CreateEvent 
( 
Event 
eventt %
)% &
;& '
void 
UpdateEvent 
( 
Event 
eventt %
)% &
;& '
void 
DeleteEvent 
( 
Event 
eventt %
)% &
;& '
void 
ReserveTickets 
( 
ClientEvent '
clientEvent( 3
)3 4
;4 5
} 
} ®

7E:\Work\Repos\EventEase\EventService\Data\IVenueRepo.cs
	namespace 	
EventService
 
. 
Data 
{ 
public 

	interface 

IVenueRepo 
{ 
Task 
< 
bool 
> 
SaveChanges 
( 
)  
;  !
Task		 
<		 
IEnumerable		 
<		 
Venue		 
>		 
>		  
GetAllVenues		! -
(		- .
)		. /
;		/ 0
Task 
< 
Venue 
> 
GetVenueById  
(  !
int! $
id% '
)' (
;( )
Task 
< 
Venue 
>  
GetVenueByExternalId (
(( )
string) /
id0 2
)2 3
;3 4
void 
CreateVenue 
( 
Venue 
venue $
)$ %
;% &
void 
UpdateVenue 
( 
Venue 
venue $
)$ %
;% &
void 
DeleteVenue 
( 
Venue 
venue $
)$ %
;% &
} 
} πP
3E:\Work\Repos\EventEase\EventService\Data\PrepDb.cs
	namespace 	
EventService
 
. 
Data 
{ 
public 

class 
PrepDb 
{ 
public 
static 
void 
PrepPopulation )
() *
IApplicationBuilder* =
app> A
,A B
boolC G
isProdH N
)N O
{ 	
using		 
(		 
var		 
serviceScope		 #
=		$ %
app		& )
.		) *
ApplicationServices		* =
.		= >
CreateScope		> I
(		I J
)		J K
)		K L
{

 
SeedData 
( 
serviceScope %
.% &
ServiceProvider& 5
.5 6

GetService6 @
<@ A
AppDbContextA M
>M N
(N O
)O P
,P Q
isProdR X
)X Y
;Y Z
} 
} 	
private 
static 
void 
SeedData $
($ %
AppDbContext% 1
context2 9
,9 :
bool; ?
isProd@ F
)F G
{ 	
if 
( 
! 
context 
. 
Events 
.  
Any  #
(# $
)$ %
||& (
!) *
context* 1
.1 2
Clients2 9
.9 :
Any: =
(= >
)> ?
||@ B
!C D
contextD K
.K L
VenuesL R
.R S
AnyS V
(V W
)W X
)X Y
{   
Console"" 
."" 
	WriteLine"" !
(""! "
$str""" 6
)""6 7
;""7 8
context## 
.## 
Venues## 
.## 
AddRange## '
(##' (
new$$ 
Venue$$ 
($$ 
)$$ 
{$$  !

ExternalId$$! +
=$$+ ,
$str$$, R
,$$R S
Name$$T X
=$$X Y
$str$$Y l
,$$l m
Email$$n s
=$$s t
$str	$$t Ö
,
$$Ö Ü
PhoneNumber
$$á í
=
$$í ì
$str
$$î ß
,
$$ß ®
Address
$$© ∞
=
$$∞ ±
$str
$$± ≈
,
$$≈ ∆
City
$$« À
=
$$À Ã
$str
$$Ã ÿ
}
$$ÿ Ÿ
)%% 
;%% 
Console(( 
.(( 
	WriteLine(( !
(((! "
$str((" 7
)((7 8
;((8 9
context)) 
.)) 
Events)) 
.)) 
AddRange)) '
())' (
new++ 
Event++ 
(++ 
)++ 
{++  !
Name++" &
=++' (
$str++) ?
,++? @
Type++A E
=++F G
$str++H O
,++O P
Artist++Q W
=++X Y
$str++Z o
,++o p
Description++q |
=++} ~
$str	++ ø
,
++ø ¿
TotalTickets
++¡ Õ
=
++Œ œ
$num
++– ”
,
++” ‘
RemainingTickets
++’ Â
=
++Ê Á
$num
++Ë Î
,
++Î Ï
VenueId
++Ì Ù
=
++ı ˆ
$num
++˜ ¯
}
++˙ ˚
,
++˚ ¸
new,, 
Event,, 
(,, 
),, 
{,,  !
Name,," &
=,,' (
$str,,) :
,,,: ;
Type,,< @
=,,A B
$str,,C K
,,,K L
Artist,,M S
=,,T U
$str,,V e
,,,e f
Description,,g r
=,,s t
$str	,,u ª
,
,,ª º
TotalTickets
,,Ω …
=
,,  À
$num
,,Ã œ
,
,,œ –
RemainingTickets
,,— ·
=
,,‚ „
$num
,,‰ Á
,
,,Á Ë
VenueId
,,È 
=
,,Ò Ú
$num
,,Û Ù
}
,,ˆ ˜
,
,,˜ ¯
new-- 
Event-- 
(-- 
)-- 
{--  !
Name--" &
=--' (
$str--) E
,--E F
Type--G K
=--L M
$str--N S
,--S T
Artist--U [
=--\ ]
$str--^ n
,--n o
Description--p {
=--| }
$str	--~ ”
,
--” ‘
TotalTickets
--’ ·
=
--‚ „
$num
--‰ Á
,
--Á Ë
RemainingTickets
--È ˘
=
--˙ ˚
$num
--¸ ˇ
,
--ˇ Ä
VenueId
--Å à
=
--â ä
$num
--ã å
}
--ç é
,
--é è
new.. 
Event.. 
(.. 
).. 
{..  !
Name.." &
=..' (
$str..) <
,..< =
Type..> B
=..C D
$str..E P
,..P Q
Artist..R X
=..Y Z
$str..[ k
,..k l
Description..m x
=..y z
$str	..{ Ã
,
..Ã Õ
TotalTickets
..Œ ⁄
=
..€ ‹
$num
..› ‡
,
..‡ ·
RemainingTickets
..‚ Ú
=
..Û Ù
$num
..ı ¯
,
..¯ ˘
VenueId
..˙ Å
=
..Ç É
$num
..Ñ Ö
}
..á à
,
..à â
new// 
Event// 
(// 
)// 
{//  !
Name//" &
=//' (
$str//) ?
,//? @
Type//A E
=//F G
$str//H O
,//O P
Artist//Q W
=//X Y
$str//Z p
,//p q
Description//r }
=//~ 
$str
//Ä ”
,
//” ‘
TotalTickets
//’ ·
=
//‚ „
$num
//‰ Á
,
//Á Ë
RemainingTickets
//È ˘
=
//˙ ˚
$num
//¸ ˇ
,
//ˇ Ä
VenueId
//Å à
=
//â ä
$num
//ã å
}
//é è
,
//è ê
new00 
Event00 
(00 
)00 
{00  !
Name00" &
=00' (
$str00) >
,00> ?
Type00@ D
=00E F
$str00G S
,00S T
Artist00U [
=00\ ]
$str00^ r
,00r s
Description00t 
=
00Ä Å
$str
00Ç ◊
,
00◊ ÿ
TotalTickets
00Ÿ Â
=
00Ê Á
$num
00Ë Î
,
00Î Ï
RemainingTickets
00Ì ˝
=
00˛ ˇ
$num
00Ä É
,
00É Ñ
VenueId
00Ö å
=
00ç é
$num
00è ê
}
00í ì
,
00ì î
new11 
Event11 
(11 
)11 
{11  !
Name11" &
=11' (
$str11) A
,11A B
Type11C G
=11H I
$str11J P
,11P Q
Artist11R X
=11Y Z
$str11[ m
,11m n
Description11o z
=11{ |
$str	11}  
,
11  À
TotalTickets
11Ã ÿ
=
11Ÿ ⁄
$num
11€ ﬁ
,
11ﬁ ﬂ
RemainingTickets
11‡ 
=
11Ò Ú
$num
11Û ˆ
,
11ˆ ˜
VenueId
11¯ ˇ
=
11Ä Å
$num
11Ç É
}
11Ö Ü
,
11Ü á
new22 
Event22 
(22 
)22 
{22  !
Name22" &
=22' (
$str22) 9
,229 :
Type22; ?
=22@ A
$str22B N
,22N O
Artist22P V
=22W X
$str22Y j
,22j k
Description22l w
=22x y
$str	22z »
,
22» …
TotalTickets
22  ÷
=
22◊ ÿ
$num
22Ÿ ‹
,
22‹ ›
RemainingTickets
22ﬁ Ó
=
22Ô 
$num
22Ò Ù
,
22Ù ı
VenueId
22ˆ ˝
=
22˛ ˇ
$num
22Ä Å
}
22É Ñ
,
22Ñ Ö
new33 
Event33 
(33 
)33 
{33  !
Name33" &
=33' (
$str33) 8
,338 9
Type33: >
=33? @
$str33A K
,33K L
Artist33M S
=33T U
$str33V c
,33c d
Description33e p
=33q r
$str	33s √
,
33√ ƒ
TotalTickets
33≈ —
=
33“ ”
$num
33‘ ◊
,
33◊ ÿ
RemainingTickets
33Ÿ È
=
33Í Î
$num
33Ï Ô
,
33Ô 
VenueId
33Ò ¯
=
33˘ ˙
$num
33˚ ¸
}
33˛ ˇ
,
33ˇ Ä
new44 
Event44 
(44 
)44 
{44  !
Name44" &
=44' (
$str44) ?
,44? @
Type44A E
=44F G
$str44H Q
,44Q R
Artist44S Y
=44Z [
$str44\ i
,44i j
Description44k v
=44w x
$str	44y Õ
,
44Õ Œ
TotalTickets
44œ €
=
44‹ ›
$num
44ﬁ ·
,
44· ‚
RemainingTickets
44„ Û
=
44Ù ı
$num
44ˆ ˘
,
44˘ ˙
VenueId
44˚ Ç
=
44É Ñ
$num
44Ö Ü
}
44à â
)55 
;55 
Console88 
.88 
	WriteLine88 !
(88! "
$str88" 7
)887 8
;888 9
context99 
.99 
Clients99 
.99  
AddRange99  (
(99( )
new:: 
Client:: 
(:: 
)::  
{::! "

ExternalId::" ,
=::, -
$str::- S
,::S T
Name::U Y
=::Y Z
$str::Z f
,::f g
Email::h m
=::m n
$str	::n Ä
}
::Ä Å
);; 
;;; 
context>> 
.>> 
ClientEvents>> $
.>>$ %
Add>>% (
(>>( )
new>>) ,
ClientEvent>>- 8
(>>8 9
)>>9 :
{>>; <

TicketsNum?? 
=??  
$num??! "
,??" #
ClientId@@ 
=@@ 
$num@@  
,@@  !
EventIdAA 
=AA 
$numAA 
}BB 
)BB 
;BB 
contextDD 
.DD 
SaveChangesDD #
(DD# $
)DD$ %
;DD% &
}EE 
elseFF 
{GG 
ConsoleHH 
.HH 
	WriteLineHH !
(HH! "
$strHH" 5
)HH5 6
;HH6 7
}II 
}JJ 	
}KK 
}LL ô
6E:\Work\Repos\EventEase\EventService\Data\VenueRepo.cs
	namespace 	
EventService
 
. 
Data 
{		 
public

 

class

 
	VenueRepo

 
:

 

IVenueRepo

 '
{ 
private 
readonly 
AppDbContext %
_context& .
;. /
public 
	VenueRepo 
( 
AppDbContext %
context& -
)- .
{ 	
_context 
= 
context 
; 
} 	
public 
void 
CreateVenue 
(  
Venue  %
venue& +
)+ ,
{ 	
if 
( 
venue 
is 
null 
) 
{ 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
venue7 <
)< =
)= >
;> ?
} 
_context 
. 
Venues 
. 
Add 
(  
venue  %
)% &
;& '
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Venue& +
>+ ,
>, -
GetAllVenues. :
(: ;
); <
{ 	
return 
await 
_context !
.! "
Venues" (
.( )
ToListAsync) 4
(4 5
)5 6
;6 7
} 	
public!! 
async!! 
Task!! 
<!! 
Venue!! 
>!!  
GetVenueById!!! -
(!!- .
int!!. 1
id!!2 4
)!!4 5
{"" 	
return## 
await## 
_context## !
.##! "
Venues##" (
.$$ 
Where$$ 
($$ 
v$$ 
=>$$ 
v$$ 
.$$ 
Id$$  
==$$! #
id$$$ &
)$$& '
.%% 
Include%% 
(%% 
v%% 
=>%% 
v%% 
.%%  
Events%%  &
)%%& '
.&& 
FirstOrDefaultAsync&& $
(&&$ %
)&&% &
;&&& '
}'' 	
public)) 
async)) 
Task)) 
<)) 
Venue)) 
>))   
GetVenueByExternalId))! 5
())5 6
string))6 <
id))= ?
)))? @
{** 	
return++ 
await++ 
_context++ !
.++! "
Venues++" (
.++( )
FirstOrDefaultAsync++) <
(++< =
v++= >
=>++? A
v++B C
.++C D

ExternalId++D N
==++O Q
id++R T
)++T U
;++U V
},, 	
public.. 
async.. 
Task.. 
<.. 
bool.. 
>.. 
SaveChanges..  +
(..+ ,
).., -
{// 	
return00 
(00 
await00 
_context00 "
.00" #
SaveChangesAsync00# 3
(003 4
)004 5
>=006 8
$num009 :
)00: ;
;00; <
}11 	
public33 
void33 
UpdateVenue33 
(33  
Venue33  %
venue33& +
)33+ ,
{44 	
_context55 
.55 
Venues55 
.55 
Update55 "
(55" #
venue55# (
)55( )
;55) *
}66 	
public88 
void88 
DeleteVenue88 
(88  
Venue88  %
venue88& +
)88+ ,
{99 	
_context:: 
.:: 
Venues:: 
.:: 
Remove:: "
(::" #
venue::# (
)::( )
;::) *
};; 	
}<< 
}== ª
LE:\Work\Repos\EventEase\EventService\Extensions\ClaimsPrincipleExtensions.cs
	namespace 	
EventService
 
. 

Extensions !
{ 
public 

static 
class %
ClaimsPrincipleExtensions 1
{ 
public 
static 
string 
GetId "
(" #
this# '
ClaimsPrincipal( 7
	principal8 A
)A B
{ 	
var 
userIdClaim 
= 
	principal '
.' (
	FindFirst( 1
(1 2
c2 3
=>4 6
c7 8
.8 9
Type9 =
==> @
$strA E
)E F
;F G
if 
( 
userIdClaim 
!= 
null #
&&$ &
!' (
string( .
.. /
IsNullOrEmpty/ <
(< =
userIdClaim= H
.H I
ValueI N
)N O
)O P
{ 
return 
userIdClaim "
." #
Value# (
;( )
} 
return 
null 
; 
} 	
public 
static 
string 
GetRoles %
(% &
this& *
ClaimsPrincipal+ :
	principal; D
)D E
{ 	
var 
userRoleClaim 
= 
	principal  )
.) *
	FindFirst* 3
(3 4
c4 5
=>6 8
c9 :
.: ;
Type; ?
==@ B

ClaimTypesC M
.M N
RoleN R
)R S
??T V
	principalW `
.` a
	FindFirsta j
(j k
ck l
=>m o
cp q
.q r
Typer v
==w y
$str	z Ä
)
Ä Å
;
Å Ç
if 
( 
userRoleClaim 
!=  
null! %
&&& (
!) *
string* 0
.0 1
IsNullOrEmpty1 >
(> ?
userRoleClaim? L
.L M
ValueM R
)R S
)S T
{   
return!! 
userRoleClaim!! $
.!!$ %
Value!!% *
;!!* +
}"" 
return$$ 
null$$ 
;$$ 
}%% 	
}&& 
}'' „

5E:\Work\Repos\EventEase\EventService\Models\Client.cs
	namespace 	
EventService
 
. 
Models 
{ 
public 

class 
Client 
{ 
[ 	
Key	 
] 
[		 	
Required			 
]		 
public

 
int

 
Id

 
{

 
get

 
;

 
set

  
;

  !
}

" #
[ 	
Required	 
] 
public 
string 

ExternalId  
{! "
get# &
;& '
set( +
;+ ,
}- .
[ 	
Required	 
] 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	

JsonIgnore	 
] 
public 
ICollection 
< 
Event  
>  !
Events" (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
} Ç
:E:\Work\Repos\EventEase\EventService\Models\ClientEvent.cs
	namespace 	
EventService
 
. 
Models 
{ 
public 

class 
ClientEvent 
{ 
[ 	
Key	 
] 
[		 	
Required			 
]		 
public

 
int

 
Id

 
{

 
get

 
;

 
set

  
;

  !
}

" #
[ 	
Required	 
] 
public 
int 
ClientId 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
] 
public 
int 
EventId 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
] 
public 
int 

TicketsNum 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	

JsonIgnore	 
] 
public 
Event 
Event 
{ 
get  
;  !
set" %
;% &
}' (
[ 	

JsonIgnore	 
] 
public 
Client 
Client 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ç
HE:\Work\Repos\EventEase\EventService\Models\Dtos\ClientEventCreateDto.cs
	namespace 	
EventService
 
. 
Models 
. 
Dtos "
{ 
public 

class  
ClientEventCreateDto %
{ 
[ 	
Required	 
] 
public 
int 

TicketsNum 
{ 
get  #
;# $
set% (
;( )
}* +
}		 
}

 ƒ
AE:\Work\Repos\EventEase\EventService\Models\Dtos\ClientReadDto.cs
	namespace 	
EventService
 
. 
Models 
. 
Dtos "
{ 
public 

class 
ClientReadDto 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public		 
string		 
Email		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
public 
ICollection 
< 
Event  
>  !
Events" (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
} É
BE:\Work\Repos\EventEase\EventService\Models\Dtos\EventCreateDto.cs
	namespace 	
EventService
 
. 
Models 
. 
Dtos "
{ 
public 

class 
EventCreateDto 
{ 
[ 	
Required	 
] 
public 
int 
VenueId 
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
StringLength	 
( 
$num 
, 
ErrorMessage &
=' (
$str) M
)M N
]N O
[ 	
RegularExpression	 
( 
$str -
,- .
ErrorMessage/ ;
=< =
$str> W
)W X
]X Y
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
Type 
{ 
get  
;  !
set" %
;% &
}& '
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
Artist 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
Required	 
] 
public 
DateTime 
DateTime  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
ImgPath 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Required	 
] 
public   
int   
TotalTickets   
{    !
get  " %
;  % &
set  ' *
;  * +
}  , -
public"" 
int"" 
RemainingTickets"" #
{""$ %
get""& )
;"") *
set""+ .
;"". /
}""0 1
}## 
}$$ á
@E:\Work\Repos\EventEase\EventService\Models\Dtos\EventReadDto.cs
	namespace 	
EventService
 
. 
Models 
. 
Dtos "
{ 
public 

class 
EventReadDto 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public

 
string

 
Type

 
{

 
get

  
;

  !
set

" %
;

% &
}

& '
public 
string 
Artist 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
Time 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
ImgPath 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 
TotalTickets 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
RemainingTickets #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
Venue 
Venue 
{ 
get  
;  !
set" %
;% &
}' (
public 
ICollection 
< 
Client !
>! "
Clients# *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
} 
} ë
BE:\Work\Repos\EventEase\EventService\Models\Dtos\EventUpdateDto.cs
	namespace 	
EventService
 
. 
Models 
. 
Dtos "
{ 
public 

class 
EventUpdateDto 
{ 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
, 
ErrorMessage &
=' (
$str) M
)M N
]N O
[		 	
RegularExpression			 
(		 
$str		 -
,		- .
ErrorMessage		/ ;
=		< =
$str		> W
)		W X
]		X Y
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
Type 
{ 
get  
;  !
set" %
;% &
}& '
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
Artist 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
DateTime  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
ImgPath 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} î
@E:\Work\Repos\EventEase\EventService\Models\Dtos\VenueReadDto.cs
	namespace 	
EventService
 
. 
Models 
. 
Dtos "
{ 
public 

class 
VenueReadDto 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public		 
string		 
Email		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
public 
string 
PhoneNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
City 
{ 
get  
;  !
set" %
;% &
}' (
public 
ICollection 
< 
Event  
>  !
Events" (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
} ‹
4E:\Work\Repos\EventEase\EventService\Models\Event.cs
	namespace 	
EventService
 
. 
Models 
{ 
public 

class 
Event 
{ 
[ 	
Key	 
] 
[		 	
Required			 
]		 
public

 
int

 
Id

 
{

 
get

 
;

 
set

  
;

  !
}

" #
[ 	
Required	 
] 
public 
int 
VenueId 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
] 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
] 
public 
string 
Type 
{ 
get  
;  !
set" %
;% &
}& '
[ 	
Required	 
] 
public 
string 
Artist 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
Required	 
] 
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
Required	 
] 
public 
DateTime 
DateTime  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
ImgPath 
{ 
get  #
;# $
set% (
;( )
}* +
[   	
Required  	 
]   
public!! 
int!! 
TotalTickets!! 
{!!  !
get!!" %
;!!% &
set!!' *
;!!* +
}!!, -
[## 	
Required##	 
]## 
public$$ 
int$$ 
RemainingTickets$$ #
{$$$ %
get$$& )
;$$) *
set$$+ .
;$$. /
}$$0 1
[&& 	
Required&&	 
]&& 
public'' 
Venue'' 
Venue'' 
{'' 
get''  
;''  !
set''" %
;''% &
}''' (
[)) 	

JsonIgnore))	 
])) 
public** 
ICollection** 
<** 
Client** !
>**! "
Clients**# *
{**+ ,
get**- 0
;**0 1
set**2 5
;**5 6
}**7 8
}++ 
},, ≥
4E:\Work\Repos\EventEase\EventService\Models\Venue.cs
	namespace 	
EventService
 
. 
Models 
{ 
public 

class 
Venue 
{ 
[ 	
Key	 
] 
[		 	
Required			 
]		 
public

 
int

 
Id

 
{

 
get

 
;

 
set

  
;

  !
}

" #
[ 	
Required	 
] 
public 
string 

ExternalId  
{! "
get# &
;& '
set( +
;+ ,
}- .
[ 	
Required	 
] 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
PhoneNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
City 
{ 
get  
;  !
set" %
;% &
}' (
[ 	

JsonIgnore	 
] 
public 
ICollection 
< 
Event  
>  !
Events" (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
} Ô
>E:\Work\Repos\EventEase\EventService\Profiles\EventsProfile.cs
	namespace 	
EventService
 
. 
Profiles 
{ 
public 

class 
EventsProfile 
:  
Profile! (
{		 
public

 
EventsProfile

 
(

 
)

 
{ 	
	CreateMap 
< 
Event 
, 
EventReadDto )
>) *
(* +
)+ ,
;, -
	CreateMap 
< 
EventCreateDto $
,$ %
Event& +
>+ ,
(, -
)- .
;. /
	CreateMap 
<  
ClientEventCreateDto *
,* +
ClientEvent, 7
>7 8
(8 9
)9 :
;: ;
	CreateMap 
< 
Client 
, 
ClientReadDto +
>+ ,
(, -
)- .
;. /
	CreateMap 
< 
Venue 
, 
VenueReadDto )
>) *
(* +
)+ ,
;, -
	CreateMap 
< 
Event 
, 
EventCreated )
>) *
(* +
)+ ,
;, -
	CreateMap 
< 
Event 
, 
EventUpdated )
>) *
(* +
)+ ,
;, -
	CreateMap 
< 
Event 
, 
EventDeleted )
>) *
(* +
)+ ,
;, -
	CreateMap 
< 
Venue 
, 
MessageBusEvents -
.- .
Models. 4
.4 5
Dto5 8
.8 9
Venue9 >
>> ?
(? @
)@ A
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
Id( *
,* +
opt, /
=>0 2
opt 
. 
MapFrom 
(  
src  #
=>$ &
src' *
.* +

ExternalId+ 5
)5 6
) 
; 
	CreateMap 
< 
VenueCreated "
," #
Venue$ )
>) *
(* +
)+ ,
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (

ExternalId( 2
,2 3
opt4 7
=>8 :
opt 
. 
MapFrom 
(  
src  #
=>$ &
src' *
.* +
Id+ -
)- .
) 
.   
	ForMember   
(   
dest   
=>    "
dest  # '
.  ' (
Id  ( *
,  * +
opt!! 
=>!! 
opt!! 
.!! 
Ignore!! %
(!!% &
)!!& '
)"" 
;"" 
	CreateMap$$ 
<$$ 
ClientCreated$$ #
,$$# $
Client$$% +
>$$+ ,
($$, -
)$$- .
.%% 
	ForMember%% 
(%% 
dest%% 
=>%%  "
dest%%# '
.%%' (

ExternalId%%( 2
,%%2 3
opt%%4 7
=>%%8 :
opt&& 
.&& 
MapFrom&& 
(&&  
src&&  #
=>&&$ &
src&&' *
.&&* +
Id&&+ -
)&&- .
)'' 
.(( 
	ForMember(( 
((( 
dest(( 
=>((  "
dest((# '
.((' (
Id((( *
,((* +
opt)) 
=>)) 
opt)) 
.)) 
Ignore)) %
())% &
)))& '
)** 
;** 
}++ 	
},, 
}-- ∆h
/E:\Work\Repos\EventEase\EventService\Program.cs
var		 
builder		 
=		 
WebApplication		 
.		 
CreateBuilder		 *
(		* +
args		+ /
)		/ 0
;		0 1
var 
rabbitMQ 
= 
$str 
; 
var 
	jwtConfig 
= 
$str 
; 
var 
connectionString 
= 
$str 
; 
if 
( 
builder 
. 
Environment 
. 
IsProduction $
($ %
)% &
)& '
{ 
rabbitMQ 
= 
Environment 
. "
GetEnvironmentVariable 1
(1 2
$str2 =
)= >
;> ?
Console 
. 
	WriteLine 
( 
rabbitMQ 
) 
;  
	jwtConfig 
= 
Environment 
. "
GetEnvironmentVariable 2
(2 3
$str3 8
)8 9
;9 :
Console 
. 
	WriteLine 
( 
	jwtConfig 
)  
;  !
connectionString 
= 
Environment "
." #"
GetEnvironmentVariable# 9
(9 :
$str: V
)V W
;W X
Console 
. 
	WriteLine 
( 
connectionString &
)& '
;' (
Console 
. 
	WriteLine 
( 
$str 0
)0 1
;1 2
builder 
. 
Services 
. 
AddDbContext !
<! "
AppDbContext" .
>. /
(/ 0
options0 7
=>8 :
options 
. 
UseSqlServer 
( 
connectionString -
)- .
) 
; 
} 
else 
{   
rabbitMQ!! 
=!! 
$"!! 
$str!! $
{!!$ %
builder!!% ,
.!!, -
Configuration!!- :
[!!: ;
$str!!; I
]!!I J
}!!J K
$str!!K L
{!!L M
builder!!M T
.!!T U
Configuration!!U b
[!!b c
$str!!c q
]!!q r
}!!r s
"!!s t
;!!t u
	jwtConfig"" 
="" 
builder"" 
."" 
Configuration"" %
.""% &

GetSection""& 0
(""0 1
$str""1 C
)""C D
.""D E
Value""E J
;""J K
Console$$ 
.$$ 
	WriteLine$$ 
($$ 
$str$$ ,
)$$, -
;$$- .
builder%% 
.%% 
Services%% 
.%% 
AddDbContext%% !
<%%! "
AppDbContext%%" .
>%%. /
(%%/ 0
opt%%0 3
=>%%4 6
opt&& 
.&& 
UseInMemoryDatabase&& 
(&&  
$str&&  '
)&&' (
)'' 
;'' 
}(( 
builder** 
.** 
Services** 
.** 
AddAutoMapper** 
(** 
	AppDomain** (
.**( )
CurrentDomain**) 6
.**6 7
GetAssemblies**7 D
(**D E
)**E F
)**F G
;**G H
builder-- 
.-- 
Services-- 
.-- 
AddMassTransit-- 
(--  
config--  &
=>--' )
{--* +
config// 

.//
 
AddConsumer// 
<//  
VenueCreatedConsumer// +
>//+ ,
(//, -
)//- .
;//. /
config00 

.00
 
AddConsumer00 
<00  
VenueUpdatedConsumer00 +
>00+ ,
(00, -
)00- .
;00. /
config11 

.11
 
AddConsumer11 
<11  
VenueDeletedConsumer11 +
>11+ ,
(11, -
)11- .
;11. /
config22 

.22
 
AddConsumer22 
<22 !
ClientCreatedConsumer22 ,
>22, -
(22- .
)22. /
;22/ 0
config33 

.33
 
AddConsumer33 
<33 !
ClientUpdatedConsumer33 ,
>33, -
(33- .
)33. /
;33/ 0
config44 

.44
 
AddConsumer44 
<44 !
ClientDeletedConsumer44 ,
>44, -
(44- .
)44. /
;44/ 0
config66 

.66
 -
!SetKebabCaseEndpointNameFormatter66 ,
(66, -
)66- .
;66. /
config88 

.88
 
UsingRabbitMq88 
(88 
(88 
ctx88 
,88 
cfg88 "
)88" #
=>88$ &
{88' (
Console99 	
.99	 

	WriteLine99
 
(99 
rabbitMQ99 
)99 
;99 
cfg:: 
.:: 
Host:: 
(:: 
rabbitMQ:: 
):: 
;:: 
cfg<< 
.<< 
ReceiveEndpoint<< 
(<< 
$str<< A
,<<A B
c<<C D
=><<E G
{<<H I
c>> 
.>> 
ConfigureConsumer>> 
<>>   
VenueCreatedConsumer>>  4
>>>4 5
(>>5 6
ctx>>6 9
)>>9 :
;>>: ;
}?? 	
)??	 

;??
 
cfgAA 
.AA 
ReceiveEndpointAA 
(AA 
$strAA A
,AAA B
cAAC D
=>AAE G
{AAH I
cCC 
.CC 
ConfigureConsumerCC 
<CC   
VenueUpdatedConsumerCC  4
>CC4 5
(CC5 6
ctxCC6 9
)CC9 :
;CC: ;
}DD 	
)DD	 

;DD
 
cfgFF 
.FF 
ReceiveEndpointFF 
(FF 
$strFF A
,FFA B
cFFC D
=>FFE G
{FFH I
cHH 
.HH 
ConfigureConsumerHH 
<HH   
VenueDeletedConsumerHH  4
>HH4 5
(HH5 6
ctxHH6 9
)HH9 :
;HH: ;
}II 	
)II	 

;II
 
cfgKK 
.KK 
ReceiveEndpointKK 
(KK 
$strKK B
,KKB C
cKKD E
=>KKF H
{KKI J
cMM 
.MM 
ConfigureConsumerMM 
<MM  !
ClientCreatedConsumerMM  5
>MM5 6
(MM6 7
ctxMM7 :
)MM: ;
;MM; <
}NN 	
)NN	 

;NN
 
cfgPP 
.PP 
ReceiveEndpointPP 
(PP 
$strPP B
,PPB C
cPPD E
=>PPF H
{PPI J
cRR 
.RR 
ConfigureConsumerRR 
<RR  !
ClientUpdatedConsumerRR  5
>RR5 6
(RR6 7
ctxRR7 :
)RR: ;
;RR; <
}SS 	
)SS	 

;SS
 
cfgUU 
.UU 
ReceiveEndpointUU 
(UU 
$strUU B
,UUB C
cUUD E
=>UUF H
{UUI J
cWW 
.WW 
ConfigureConsumerWW 
<WW  !
ClientDeletedConsumerWW  5
>WW5 6
(WW6 7
ctxWW7 :
)WW: ;
;WW; <
}XX 	
)XX	 

;XX
 
}YY 
)YY 
;YY 
}ZZ 
)ZZ 
;ZZ 
builder]] 
.]] 
Services]] 
.]] 
	AddScoped]] 
<]] 

IEventRepo]] %
,]]% &
	EventRepo]]' 0
>]]0 1
(]]1 2
)]]2 3
;]]3 4
builder^^ 
.^^ 
Services^^ 
.^^ 
	AddScoped^^ 
<^^ 
IClientRepo^^ &
,^^& '

ClientRepo^^( 2
>^^2 3
(^^3 4
)^^4 5
;^^5 6
builder__ 
.__ 
Services__ 
.__ 
	AddScoped__ 
<__ 

IVenueRepo__ %
,__% &
	VenueRepo__' 0
>__0 1
(__1 2
)__2 3
;__3 4
varbb "
allowedSpecificOriginsbb 
=bb 
$strbb 6
;bb6 7
builderdd 
.dd 
Servicesdd 
.dd 
AddCorsdd 
(dd 
optionsdd  
=>dd! #
{ee 
optionsff 
.ff 
	AddPolicyff 
(ff 
nameff 
:ff "
allowedSpecificOriginsff 2
,ff2 3
policygg 
=>gg 
{hh 	
policyii 
.ii 
WithOriginsii 
(ii 
$strii 4
,ii4 5
$strjj  7
)jj7 8
;jj8 9
}kk 	
)ll 
;ll 
}mm 
)mm 
;mm 
builderpp 
.pp 
Servicespp 
.pp 
AddControllerspp 
(pp  
)pp  !
;pp! "
builderrr 
.rr 
Servicesrr 
.rr #
AddEndpointsApiExplorerrr (
(rr( )
)rr) *
;rr* +
builderss 
.ss 
Servicesss 
.ss 
AddSwaggerGenss 
(ss 
)ss  
;ss  !
builderww 
.ww 
Servicesww 
.ww 
AddAuthenticationww "
(ww" #
optionsww# *
=>ww+ -
{xx 
optionsyy 
.yy %
DefaultAuthenticateSchemeyy )
=yy* +
JwtBearerDefaultsyy, =
.yy= > 
AuthenticationSchemeyy> R
;yyR S
optionszz 
.zz 
DefaultSchemezz 
=zz 
JwtBearerDefaultszz  1
.zz1 2 
AuthenticationSchemezz2 F
;zzF G
options{{ 
.{{ "
DefaultChallengeScheme{{ &
={{' (
JwtBearerDefaults{{) :
.{{: ; 
AuthenticationScheme{{; O
;{{O P
}|| 
)|| 
.}} 
AddJwtBearer}} 
(}} 
jwt}} 
=>}} 
{~~ 
var 
key 
= 
Encoding 
. 
ASCII  
.  !
GetBytes! )
() *
	jwtConfig* 3
)3 4
;4 5
jwt
ÄÄ 
.
ÄÄ 
	SaveToken
ÄÄ 
=
ÄÄ 
true
ÄÄ 
;
ÄÄ 
jwt
ÇÇ 
.
ÇÇ '
TokenValidationParameters
ÇÇ %
=
ÇÇ& '
new
ÇÇ( +'
TokenValidationParameters
ÇÇ, E
(
ÇÇE F
)
ÇÇF G
{
ÉÉ 	&
ValidateIssuerSigningKey
ÑÑ $
=
ÑÑ% &
true
ÑÑ' +
,
ÑÑ+ ,
IssuerSigningKey
ÖÖ 
=
ÖÖ 
new
ÖÖ ""
SymmetricSecurityKey
ÖÖ# 7
(
ÖÖ7 8
key
ÖÖ8 ;
)
ÖÖ; <
,
ÖÖ< =
ValidateIssuer
ÜÜ 
=
ÜÜ 
false
ÜÜ "
,
ÜÜ" #
ValidateAudience
áá 
=
áá 
false
áá $
,
áá$ %#
RequireExpirationTime
ââ !
=
ââ" #
true
ââ$ (
,
ââ( )
ValidateLifetime
ää 
=
ää 
true
ää #
,
ää# $
	ClockSkew
ãã 
=
ãã 
TimeSpan
ãã  
.
ãã  !
Zero
ãã! %
}
åå 	
;
åå	 

}
çç 
)
çç 
;
çç 
builderèè 
.
èè 
Services
èè 
.
èè 
AddAuthorization
èè !
(
èè! "
)
èè" #
;
èè# $
varëë 
app
ëë 
=
ëë 	
builder
ëë
 
.
ëë 
Build
ëë 
(
ëë 
)
ëë 
;
ëë 
ifîî 
(
îî 
app
îî 
.
îî 
Environment
îî 
.
îî 
IsDevelopment
îî !
(
îî! "
)
îî" #
)
îî# $
{ïï 
app
ññ 
.
ññ 

UseSwagger
ññ 
(
ññ 
)
ññ 
;
ññ 
app
óó 
.
óó 
UseSwaggerUI
óó 
(
óó 
)
óó 
;
óó 
}òò 
PrepDböö 
.
öö 
PrepPopulation
öö 
(
öö 
app
öö 
,
öö 
app
öö 
.
öö 
Environment
öö *
.
öö* +
IsProduction
öö+ 7
(
öö7 8
)
öö8 9
)
öö9 :
;
öö: ;
appúú 
.
úú !
UseHttpsRedirection
úú 
(
úú 
)
úú 
;
úú 
appûû 
.
ûû 
UseCors
ûû 
(
ûû $
allowedSpecificOrigins
ûû "
)
ûû" #
;
ûû# $
app†† 
.
†† 
UseAuthorization
†† 
(
†† 
)
†† 
;
†† 
app¢¢ 
.
¢¢ 
MapControllers
¢¢ 
(
¢¢ 
)
¢¢ 
;
¢¢ 
app§§ 
.
§§ 
Run
§§ 
(
§§ 
)
§§ 	
;
§§	 
