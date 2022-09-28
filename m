Return-Path: <SRS0=gucT=Z7=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=BRcqp5Dxnr/kDUTNK6bWnumBDhpLwfeutIJmdNCeRzs=;
        b=gOBFNn405h+Q7IWCSuhV4YMqbXqeMVSX49qDEivB7d7ebdoutoifF9JAXjf/+1016k
         PKJfZstV63Wvm4gvySYSYf3E6z7++77nSHAB1+9+4+GuS979WNRdapgznJhXUXRIWD60
         f0wIAugwWxBce42w84Pkxa5Aakxtz05i9KF2GAlsg+SNhLfoBSzDiFPnF/eKAcRW8dLE
         YcZwQYz0bhiiB00qYaxAEgTHfyj7U+GRcV6tqXbLfqkvrenS2ThV2FBenSeRbm69Ihtq
         8ocSXxSQT36HQLjcWoVFA/doTggq/mTVdawMPqCvFKyYkzgp3QicHT0uXJWj73+pLavh
         c0Fg==
Message-ID: <c8ec96f6-f592-36be-3d8a-55030d430caa@gmail.com>
Date: Wed, 28 Sep 2022 23:28:53 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/2] memorder: Put \FloatBarrier in front of Section
 15.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Commit e39bbe1b0856 ("memorder: Add example showing store breaking
release-acquire chain") added a couple of code snippets in the
final subsection of Section 15.2.
In 1c builds, this caused the beginning part of Section 15.3 to
appear in the middle of floating code snippets of Section 15.2.

This can be prevented by putting \FloatBarrier in front of Section
15.3, with a (somewhat) wide vertical space left at the end of
Section 15.2.

Note: \FloatBarrier does nothing unless there are some overloaded
float objects. Therefore, 2c and eb builds are not affected.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

Another option would be to use the "section" option of "placeins"
packages as is done for eb builds. I tried but I got quite a few
sparse-looking pages in other part of 1c builds. So I think adding
a \FloatBarrier here is a reasonable thing to do.

        Thanks, Akira
--
 memorder/memorder.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 66f75662f26c..f85cfe6ca702 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -2404,6 +2404,8 @@ sea of more complex memory-ordering constraints.
 % @@@ Exercises?
 % @@@ Hardware details from Appendix?
 
+\FloatBarrier
+
 \section{Compile-Time Consternation}
 \label{sec:memorder:Compile-Time Consternation}
 %

base-commit: 43d8aa12c84c8b26ffdb8479b4d793cc0159030e
-- 
2.25.1

