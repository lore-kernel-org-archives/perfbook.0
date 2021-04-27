Return-Path: <SRS0=/ExH=JY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z5njvYuRm+CfOHmMLnSDsHxGArDJxBXF+/ARSUOO0Zg=;
        b=TGa1J1uhm+QccxhpqjppOFPDsVsf8wWs+IkOtd48gRlb82CBQVFA7r9J0eNkTWUq3v
         i+VZPCemPi9FTk5X7Dmc2t3oDWwNp789ZrljG48SWOlSFp8MPa+ETo5G3AUHc9yawdfN
         bFtnREtPkZpU7oLWQtyEhTmjkOv+oSmLvzhmqRUOFM+kIcvJG3HZ6vjtblxU+lRBYKIr
         d1EDS1SzuG9tJFSQ7F68F+MO0BlEqW5M5ELY5fJNjx9kgiDLOfgSma7UsfOLQ8JpSpmF
         BkEKC2z0GvjaRVYjwlDrSOkk1xigfwBJD26SJYwF7r83aOxUVWQmtr5uRfEypuWWLoOX
         H3pw==
Subject: [PATCH -perfbook v2 8/9] treewide: Fix space in front of \cite{}
References: <71cd07ce-5753-4007-8fab-3654956e5a92@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <158c11ba-6821-7b6b-4594-de8b36f7a6ed@gmail.com>
Date: Wed, 28 Apr 2021 00:31:33 +0900
MIME-Version: 1.0
In-Reply-To: <71cd07ce-5753-4007-8fab-3654956e5a92@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 debugging/debugging.tex | 4 ++--
 formal/ppcmem.tex       | 4 ++--
 intro/intro.tex         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 4c77453d..7d739a62 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -760,8 +760,8 @@ viewpoint of developers thinking in terms of C as assembly language
 with additional syntax.
 KCSAN therefore provides a \co{data_race()} construct to forgive
 known-benign \IXpl{data race}, and also the \co{ASSERT_EXCLUSIVE_ACCESS()}
-and \co{ASSERT_EXCLUSIVE_WRITER()} assertions to explicitly check
-for data races\cite{MarcoElver2020FearDataRaceDetector1,MarcoElver2020FearDataRaceDetector2}.
+and \co{ASSERT_EXCLUSIVE_WRITER()} assertions to explicitly check for data
+races~\cite{MarcoElver2020FearDataRaceDetector1,MarcoElver2020FearDataRaceDetector2}.
 
 So what can be done in cases where checking is necessary, but where the
 overhead of runtime checking cannot be tolerated?
diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index 019d0161..349ec072 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -356,8 +356,8 @@ cannot happen.
 	on both sides.
 	The ordering provided by \co{lwsync} is insufficient for this
 	purpose, and so \co{sync} should be used instead.
-	This change has since been made~%
-	\cite{BoqunFeng2015:powerpc:value-returning-atomics}
+	This change has since been
+	made~\cite{BoqunFeng2015:powerpc:value-returning-atomics}
 	in response to an email thread discussing a couple of other litmus
 	tests~\cite{Paulmck2015:powerpc:value-returning-atomics}.
 	Finding any other bugs that the Linux kernel might have is left
diff --git a/intro/intro.tex b/intro/intro.tex
index 812b34fd..852ea82d 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -41,7 +41,7 @@ social-networking tools.
 As recently as 1968, such content creation was a far-out research
 project~\cite{DouglasEngelbart1968}, described at
 the time as
-``like a UFO landing on the White House lawn''\cite{ScottGriffen2000}.
+``like a UFO landing on the White House lawn''~\cite{ScottGriffen2000}.
 % http://www.ibiblio.org/pioneers/engelbart.html
 % http://www.histech.rwth-aachen.de/www/quellen/engelbart/ahi62index.html
 
-- 
2.17.1


