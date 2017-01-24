Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=7Skuf5/k3LQLpu81RutFIo3nky+/mbaG+Be9Ds2hjgk=;
 b=mF4jlKUvj2ghb2VM2QtwxuptTInguCg9JaWvQrQnXb+y5wKmaOldZaCfThUWLz/1T5
 lMJQV8Aifxwgzf69WSWIMOJr5HKxekQXXoujlamOAdbWIxR8GoHLSQ4zbOuEPii3ttkl
 QYdEE3CHkc7S7yb8BxO4WIdqvr95VvYAn4k+kfEWQNmzZQCzwdNOLAlrbFwUC2PVqzOI
 J33p8B5wF9P0fgdqx6sAXBi1R+/UGWd2dHquyZjEWjbuMCnIe+bYsGl7OwLNv8/PMEuS
 GqiBkb69/FNbYEElW4NsQ+ii1EtbDhqYPOM820MWXuaLcGWw8XpkrSn+s9mZnhZhJPgD
 uTiw==
Content-Type: text/plain;	charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 0/2] bib: Replace UTF-8 chars with plain ASCII chars
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20170124013720.GB28085@linux.vnet.ibm.com>
Date: Tue, 24 Jan 2017 11:35:01 +0900
Content-Transfer-Encoding: quoted-printable
Message-Id: <48F8DC35-0F9A-4574-8388-7FAD29DB54E6@gmail.com>
References: <2fba7d76-719e-8947-cbc0-ee25040f84f1@gmail.com>
 <20170117222709.GG5238@linux.vnet.ibm.com>
 <de905c24-73a4-c407-38b9-120b08e0187b@gmail.com>
 <20170124013720.GB28085@linux.vnet.ibm.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>


> On Jan 24, 2017, at 10:37, Paul E. McKenney <paulmck@linux.vnet.ibm.com> w=
rote:
>=20
>> On Wed, Jan 18, 2017 at 07:51:28AM +0900, Akira Yokosawa wrote:
>>> On 2017/01/17 14:27:09 -0800, Paul E. McKenney wrote:
>>> On Wed, Jan 18, 2017 at 12:21:41AM +0900, Akira Yokosawa wrote:
>>>>> =46rom 9818f62d94a501d24bb073a6a2127cfe6f2afc10 Mon Sep 17 00:00:00 20=
01
>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>> Date: Wed, 18 Jan 2017 00:08:46 +0900
>>>> Subject: [PATCH 0/2] bib: Replace UTF-8 chars with plain ASCII chars
>>>>=20
>>>> Hi Paul,
>>>>=20
>>>> I noticed some .bib files which contain UTF-8 encoded characters.
>>>> Again, these are patches for bibliography, so they will involve your
>>>> manual intervention to apply. Also, as the patches themselves contain
>>>> UTF-8 chars, I'm not sure you can apply them as usual.
>>>> FWIW, this set is sent in UTF-8 encoding.
>>>>=20
>>>> Anyway, could you please try them?
>>>=20
>>> They worked fine, and good catches!  You would almost think that I
>>> was guilty of copying and pasting titles...
>>>=20
>>> Queued and pushed.
>>=20
>> By the way, I'd like to confirm the status of the RFC PULL request
>> I sent last December titled "[RFC PULL] bib: Append DOI fields"
>=20
> Good reminder, thank you.
>=20
> I have pulled this and back-applied it to my bibliography database.

Thanks!

Akira=E2=80=82(from mobile, might be QP encoded)

>=20
>                            Thanx, Paul
>=20
>>> On 2016/12/03 17:26:15 +0900, Akira Yokosawa wrote:
>>> ----
>>> The following changes since commit 345ba95e4a578614247a7077602026dd7f6b1=
dd0:
>>>=20
>>>  Add Joe Duffy citations to STM discussion (2016-12-02 09:32:16 -0800)
>>>=20
>>> are available in the git repository at:
>>>=20
>>>  https://github.com/akiyks/perfbook.git bib-append-doi
>>>=20
>>> for you to fetch changes up to 8b3c3e02533a28e599448051bddf13e5cac615fe:=

>>>=20
>>>  bib/syncrefs: Append doi to Cai-DongWang1996PrioInherLock (2016-12-03 0=
9:00:31 +0900)
>>>=20
>>> ----------------------------------------------------------------
>>> Akira Yokosawa (50):
>>>      bib/perfmeas: Append doi to Anderson97
>>>      bib/cyncrefs: Append doi to HagitAttiya2011LawsOfOrder
>>>      bib/swtools: Append doi to JadeAlglave2013-cav
>>>      bib/parallelsys: Append doi to GeneAmdahl1967AmdahlsLaw
>>>      bib/syncrefs: Append doi to Anderson90
>>>      bib/TM: Append doi to Blundell2006TMdeadlock
>>>      bib/TM: Append doi to CalinCascaval2008tmtoy
>>>      bib/syncrefs: Append doi to Courtois71
>>>      bib/RCU: Append doi to AustinClements2012RCULinux:mmapsem
>>>      bib/TM: Append doi to AleksandarDragovejic2011STMnotToy
>>>      bib/swtools: Append doi to VijayDSilva2012-sas
>>>      bib/syncrefs: Append doi to Dijkstra65a
>>>      bib/TM: Append doi to DavidDice:2010:SCA:HTM:deque
>>>      bib/os: Append doi to Cheriton96a
>>>      bib/RCU: Append doi to DinakarGuniguntala2008IBMSysJ
>>>      bib/syncrefs: Append doi to Graunke90
>>>      bib/WFS: Append doi to MauriceHerlihy90a
>>>      bib/WFS: Append doi to Herlihy91
>>>      bib/syncrefs: Append doi to AndreasHaas2013CFRelaxedQueues
>>>      bib/syncrefs: Append doi to AndreasHaas2012FIFOisnt
>>>      bib/WFS: Append doi to HerlihyLM02
>>>      bib/TM: Append doi to Herlihy93a
>>>      bib/RCU: Append doi to ThomasEHart2006a
>>>      bib/syncrefs: Append doi to WilsonCHsieh92a
>>>      bib/refs: Append doi to VanJacobson88
>>>      bib/TM: Append doi to ChristianJacobi2012MainframeTM
>>>      bib/TM: Append doi to SanjeevKumar2006
>>>      bib/RCU: Append doi to Kung80
>>>      bib/syncrefs: Append doi to Lamport74a
>>>      bib/refs: Append doi to McKenney90
>>>      bib/perfmeas: Append doi to McKenney95a
>>>      bib/syncrefs: Append doi to McKenney96a
>>>      bib/syncrefs: Append doi to MellorCrummey91a
>>>      bib/os: Append doi to McKenney92b
>>>      bib/os: Append doi to McKenney92a
>>>      bib/hw: Append doi to MiloMKMartin2012scale
>>>      bib/TM: Append doi to PaulEMcKenney2010OSRGrassGreener
>>>      bib/WFS: Append doi to MichaelScott96
>>>      bib/os: Append doi to McKenney01e
>>>      bib/parallelsys: Append doi to Olukotun96
>>>      bib/TM: Append doi to ChistopherJRossbach2007a
>>>      bib/hw: Append doi to DanielJSorin2011MemModel
>>>      bib/syncrefs: Append doi to Segall84
>>>      bib/parallelsys: Append doi to DuaneSzafron1994PEMPDS
>>>      bib/TM: Append doi to JMStone93
>>>      bib/TM: Append doi to Shavit95
>>>      bib/syncrefs: Append doi to Takada:1995:RSN:527074.828566
>>>      bib/WFS: Append doi to Valois95a
>>>      bib/syncrefs: Append doi to Wisniewski94
>>>      bib/syncrefs: Append doi to Cai-DongWang1996PrioInherLock
>>>=20
>>> bib/RCU.bib         |  4 ++++
>>> bib/TM.bib          | 11 +++++++++++
>>> bib/WFS.bib         |  5 +++++
>>> bib/hw.bib          |  2 ++
>>> bib/os.bib          |  4 ++++
>>> bib/parallelsys.bib |  3 +++
>>> bib/perfmeas.bib    |  2 ++
>>> bib/refs.bib        |  2 ++
>>> bib/swtools.bib     |  2 ++
>>> bib/syncrefs.bib    | 15 +++++++++++++++
>>> 10 files changed, 50 insertions(+)
>>=20
>> This becomes somewhat outdated now.
>> Do you want them as well as other bibliography update branches I have
>> readied to be rebased and sent as new pull requests?
>>=20
>> It seems you are busy right now preparing for next merge window.
>> Let me know when you are ready to accept those request.
>> (Caution: there are *a lot of* commits.)
>>=20
>>                                          Thanks, Akira
>>=20
>>>=20
>>>                            Thanx, Paul
>>>=20
>>>>                                         Thanks, Akira
>>>> --
>>>> Akira Yokosawa (2):
>>>>  bib/hw: Replace UTF-8 encoded single quote with plain ascii
>>>>  bib: Replace UTF-8 chars with plain ascii latex sequences
>>>>=20
>>>> bib/RCU.bib      | 2 +-
>>>> bib/TM.bib       | 2 +-
>>>> bib/hw.bib       | 4 ++--
>>>> bib/realtime.bib | 2 +-
>>>> bib/swtools.bib  | 2 +-
>>>> 5 files changed, 6 insertions(+), 6 deletions(-)
>>>>=20
>>>> --=20
>>>> 2.7.4
>>>>=20
>>>=20
>>>=20
>>=20
>=20

