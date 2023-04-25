Return-Path: <SRS0=gvYa=AQ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682412713; x=1685004713;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyi4kZ6vtR0PyxCJv9MTtfrcRFJmlXjiZd3Iw5Ve/Lo=;
        b=lrD2FbUsf7+TLMozgCjrzfD2OFEBiuLTYb4EXMeFyHH/YPoI4SAHCSgsirPII5mK4x
         YII0w30uk8O3EUav4Mz9uRghsHvVnWg5vNQoOlZK74LLmd8EqZx6SHCze/Hwui2fRb38
         vJCdOrqfiMQSJxJtXx0QSzTwFtqDKUZHZvMXCWLmf0FhrKjdFPhnBKmrgaPxuwZotrXC
         /fmsDqslPK6vccyv6iyCIsHP4SMRCxYTdpaEcyfApiM0+B/1JUhtH970fbh4wGw3yrFr
         LZcnDjwQL4UYh5aphHaPTCOn4AFivwxDR1nl3axkc4z+rx1A24S8rTYZrpFoXyY2bxJg
         zkRg==
Message-ID: <843cb1f5-6d9d-1ca0-2ff6-af5b42932407@gmail.com>
Date: Tue, 25 Apr 2023 17:51:50 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook -v2] memorder: Remove \FloatBarrier in front of
 Section 15.2.8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This \FloatBarrier was supposed to prevent floats of Section 15.2
from drifting into Section 15.3.

Now it causes a mostly empty page in -1c builds.

As we have a following section (15.2.8) now, the float barrier has
become redundant.

Remove it.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
v2:
   Just remove the float barrier.  Moving it to the end of Section 15.2
   has no effect.

v1: https://www.spinics.net/lists/perfbook/msg03947.html

        Thanks, Akira

--
 memorder/memorder.tex | 2 --
 1 file changed, 2 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index c93a5b54135b..f116ab81aceb 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -2492,8 +2492,6 @@ In short, properly constructed release-acquire chains form a peaceful
 island of intuitive bliss surrounded by a strongly counter-intuitive
 sea of more complex memory-ordering constraints.
 
-\FloatBarrier
-
 \subsection{A Counter-Intuitive Case Study}
 \label{sec:memorder:A Counter-Intuitive Case Study}
 

base-commit: b7c2ed26da9ea6cbc586cde41fa5d477013cf84d
-- 
2.25.1

