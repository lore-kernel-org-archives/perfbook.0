Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ptvxmYv9eFwfVez6jkGUdKeuGuqDIGRxf604UgXL5HQ=;
 b=bHlexWECjKJhgtYcx/SgdS1hyv0DUtwY8919KJwuaF2Ve/BTgAj7asPSdGPUiXJxNI
 EnFhMsS0JYHIbi+BrRhfsXtWdLT9fGyEZpczarjaHizXShR+z+znBOPACLQ6icyiVQik
 udYxFBasK7s+AcTCuvjpvJbZ6j6ktFk+cuB/eK0pnSquAvSUiG1venYePO0vTv1dhh5K
 qn1g+LQXoVrg7Hc3vduJyqrpL+rlDmO47BOtRlz0cbzAY4Psxu3N6XgX7smYx+bAdE6a
 WbPT/nnZLMPY7UDdmd1MXUi+wYzlL/L31r9XN5MZhtSxmlOyTh0ThbKZfuCYPXVkO/6C
 IUDg==
Subject: [PATCH 3/5] Substitute 'greek mu' for 'u' in microsecond symbol
References: <69a63f84-0f40-1194-3770-e4074897388f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <50d6291a-e545-d3ca-2ceb-fbb8ae27e6d0@gmail.com>
Date: Sun, 25 Jun 2017 09:05:13 +0900
MIME-Version: 1.0
In-Reply-To: <69a63f84-0f40-1194-3770-e4074897388f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 03c83dbdba90521f6764db146528bdc0bf5b9b78 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 24 Jun 2017 22:13:22 +0900
Subject: [PATCH 3/5] Substitute 'greek mu' for 'u' in microsecond symbol

We can use "greek mu letter" encoded in UTF-8 in .svg text.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 rt/rt-regimes.svg | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rt/rt-regimes.svg b/rt/rt-regimes.svg
index 79f008d..0d9d234 100644
--- a/rt/rt-regimes.svg
+++ b/rt/rt-regimes.svg
@@ -177,7 +177,7 @@
          sodipodi:role=3D"line"
          id=3D"tspan3871"
          x=3D"8359.7979"
-         y=3D"4715.9282">1 us</tspan></text>
+         y=3D"4715.9282">1 =CE=BCs</tspan></text>
     <text
        xml:space=3D"preserve"
        style=3D"font-size:106.90753174px;font-style:normal;font-variant:=
normal;font-weight:normal;font-stretch:normal;text-align:center;line-heig=
ht:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-ancho=
r:middle;fill:#000000;fill-opacity:1;stroke:none;font-family:Symbol;-inks=
cape-font-specification:Symbol"
@@ -188,7 +188,7 @@
          sodipodi:role=3D"line"
          id=3D"tspan3875"
          x=3D"8333.0713"
-         y=3D"4555.9136">10 us</tspan></text>
+         y=3D"4555.9136">10 =CE=BCs</tspan></text>
     <text
        sodipodi:linespacing=3D"125%"
        id=3D"text3877"
@@ -199,7 +199,7 @@
          y=3D"4395.2036"
          x=3D"8306.3447"
          id=3D"tspan3879"
-         sodipodi:role=3D"line">100 us</tspan></text>
+         sodipodi:role=3D"line">100 =CE=BCs</tspan></text>
     <text
        sodipodi:linespacing=3D"125%"
        id=3D"text3881"
--=20
2.7.4


