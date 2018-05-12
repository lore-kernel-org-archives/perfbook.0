Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=e25F2b3zvwkYfADVGCqOkxQgUzHgWY4o078r1mWWlas=;
 b=er3wLzQkn33GpnlXrbcY300ULqkezec+buObtzo8jpCGeUIDH1sm8l4cNGGCRjUsdb
 5y5kVdGijXc6VVspZ6i3hJgmwJO6gPokHavGqiWtXzuygxh5jVojQsvhD+/hS9vx9U+n
 TGmoFfAcCLp2MWu4HZ4JCIdPiF4A0vg043+EkysTb3q3WtremTXXibWP4l72Rb+jID64
 NUSClqKBrVbkKlyJC54sWJyRF4k7mrGDphFqqT7M+iyNDWdVEm8k268YWFnf+d5Ji93U
 Q5g4QtmNTkAY5lpb9aMUbjJE0Enmn6tu1rVqyF755xEy8gws9UWTTfjgqiiDff45/uzf
 G3pQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/9] Update Makefile for Fedora 28
Message-ID: <8d5ad929-fbac-db70-0669-ee4b117319f4@gmail.com>
Date: Sat, 12 May 2018 13:12:28 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 0c02a970a352e72cf6e29bf2707c6404b1939ec7 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 12 May 2018 13:05:53 +0900
Subject: [PATCH 0/9] Update Makefile for Fedora 28

Hi Paul,

I tested building perfbook on Fedora 28 and encountered an
issue around "Steel City Comic" font.

On Ubuntu Zenial,
    $ fc-list -v "Steel City Comic"
says:
---
Pattern has 22 elts (size 32)
	family: "Steel City Comic"(s) "Test"(s)
	familylang: "en"(s) "en"(s)
	style: "Regular"(s) "Normal"(s) "oby=C4=8Dejn=C3=A9"(s) "Standard"(s) "=CE=
=9A=CE=B1=CE=BD=CE=BF=CE=BD=CE=B9=CE=BA=CE=AC"(s) "Normaali"(s) "Norm=C3=A1=
l"(s) "Normale"(s) "Standaard"(s) "Normalny"(s) "=D0=9E=D0=B1=D1=8B=D1=87=
=D0=BD=D1=8B=D0=B9"(s) "Norm=C3=A1lne"(s) "Navadno"(s) "Arrunta"(s)
	stylelang: "en"(s) "ca"(s) "cs"(s) "de"(s) "el"(s) "fi"(s) "hu"(s) "it"(=
s) "nl"(s) "pl"(s) "ru"(s) "sk"(s) "sl"(s) "eu"(s)
	fullname: "Steel City Comic"(s) "Test"(s)
	fullnamelang: "en"(s) "en"(s)
	slant: 0(i)(s)
	weight: 80(i)(s)
	width: 100(i)(s)
	foundry: "HL  "(s)
	file: "Path_of_fonts/steel-city-comic.regular.ttf"(s)
	index: 0(i)(s)
	outline: True(s)
	scalable: True(s)
	charset:=20
	0000: 00000000 ffffffff ffffffff 7fffffff 00000000 70002001 00800000 008=
00000
	0003: 00000000 00000000 00000000 40000000 00000000 00000000 00000000 000=
00000
	0020: 33000000 00000040 00000000 00000000 00000000 00000000 00000000 000=
00000
	0022: 00040000 00000000 00000000 00000000 00000000 00000000 00000000 000=
00000
(s)
	lang: fj|ho|ia|ie|io|nr|om|so|ss|st|sw|ts|uz|xh|zu|kj|kwm|ms|ng|rn|rw|sn=
|za(s)
	fontversion: 65536(i)(s)
	fontformat: "TrueType"(s)
	decorative: False(s)
	postscriptname: "steelcitycomic"(s)
	color: False(s)
	symbol: False(s)
---

On Fedora 28, the same command returns nothing. Instead,
    $ fc-list -v "Test"
returns the following:

---
Pattern has 23 elts (size 32)
	family: "Test"(s)
	familylang: "en"(s)
	style: "Regular"(s) "normal"(s)
	stylelang: "en"(s) "da"(s)
	fullname: "Steel City Comic"(s) "Test"(s)
	fullnamelang: "en"(s) "en"(s)
	slant: 0(i)(s)
	weight: 80(f)(s)
	width: 100(f)(s)
	foundry: "HL  "(s)
	file: "/Path_of_fonts/steel-city-comic.regular.ttf"(s)
	index: 0(i)(s)
	outline: True(s)
	scalable: True(s)
	charset:=20
	0000: 00000000 ffffffff ffffffff 7fffffff 00000000 ffffffef ffffffff fff=
fffff
	0001: ffffffff ffffffff ffffffff ffffffff 00040000 00000000 00000000 fc0=
00000
	0002: 00000000 00000000 00000000 00000000 00000000 00000000 3f0002c0 000=
00000
	0003: 00000000 00000000 00000000 40000000 ffffd7f0 fffffffb 00007fff 000=
00000
	0004: ffffdffe ffffffff dffeffff 00000000 00030000 00000000 00000000 000=
00000
	001e: 00000000 00000000 00000000 00000000 0000003f 00000000 00000000 000=
c0000
	0020: 7fb80000 560d0047 00000010 80000000 00000000 00001098 00000000 000=
00000
	0021: 00480020 00004044 78000000 00000000 003f0000 00000100 00000000 000=
00000
	0022: c6268044 00000a00 00000100 00000033 00000000 00000000 00000000 000=
00000
	0023: 00010004 00000003 00000000 00000000 00000000 00000000 00000000 000=
00000
	0025: 11111005 10101010 ffff0000 00001fff 000f1111 14041c03 03008c10 000=
00040
	0026: 00000000 1c000000 00000005 00000c69 00000000 00000000 00000000 000=
00000
	00f0: 00000036 00000000 00000000 00000000 00000000 00000000 00000000 000=
00000
	00fb: 00000006 00000000 00000000 00000000 00000000 00000000 00000000 000=
00000
(s)
	lang: aa|af|av|ay|be|bg|bi|br|bs|ca|ce|ch|co|cs|cy|da|de|el|en|eo|es|et|=
eu|fi|fj|fo|fr|fur|fy|gd|gl|gv|ho|hr|hu|ia|id|ie|ik|io|is|it|ki|kl|kum|la=
|lb|lez|lt|lv|mg|mh|mt|nb|nds|nl|nn|no|nr|nso|ny|oc|om|os|pl|pt|rm|ru|se|=
sel|sk|sl|sma|smj|smn|so|sq|sr|ss|st|sv|sw|tk|tl|tn|tr|ts|uk|uz|vo|vot|wa=
|wen|wo|xh|yap|zu|an|crh|csb|fil|hsb|ht|jv|kj|ku-tr|kwm|lg|li|ms|na|ng|pa=
p-an|pap-aw|rn|rw|sc|sg|sn|su|za(s)
	fontversion: 65536(i)(s)
	fontformat: "TrueType"(s)
	decorative: False(s)
	postscriptname: "steelcitycomic"(s)
	color: False(s)
	symbol: False(s)
	variable: False(s)
---

As you can see above, the "family" entry has "Test" alone.

So we need to substitute "Test" for "Steel City Comic" in .svg files
in such a case.

Patch #1 adds such a sed pattern in ".svg -> .pdf/.png" recipes.

Patch #2 fixes typo I found while testing Patch #1.

Patch #3 updates FAQ-BUILD.txt to cover Fedora and other Linux
distros.

The other patches add environment checks in Makefile and update
FAQ-BUILD.txt accordingly. Patch #5 is a kind of regression fix
caused by commit cb71c8ebba3c ("Makefile: Use latexpand instead of
texexpand").

I don't think you have the time to test this on Fedora 28.
Hopefully someone on the list could volunteer.

        Thanks, Akira
--
Akira Yokosawa (9):
  Makefile: Add sed pattern to accommodate fontconfig 2.13.0
  fixsvgfonts: Fix typo
  FAQ-BUILD: Add note on Fedora 28, 27, and other Linux distros
  Makefile: Add 'latexpand' existence check
  .gitignore: Add intermediate file suffix
  Makefile: Add check of version conflict of a2ping
  Makefile: Remove redundant quotation marks in error functions
  Makefile: Move check of 'Steel City Comic' font from runlatex.sh
  FAQ-BUILD: Rephrase #7 to reflect Makefile update

 .gitignore                     |  2 ++
 FAQ-BUILD.txt                  | 45 ++++++++++++++++++----------------
 Makefile                       | 55 +++++++++++++++++++++++++++++++++---=
------
 utilities/fixsvgfonts-urwps.sh |  4 +--
 utilities/fixsvgfonts.sh       |  2 +-
 utilities/runlatex.sh          |  8 ------
 6 files changed, 72 insertions(+), 44 deletions(-)

--=20
2.7.4

