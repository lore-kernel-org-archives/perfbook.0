Return-Path: <SRS0=II6t=XX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ocKvsMIk9mHRlRaKWRVX09277b0ldlNE5Eb+U/37Csw=;
        b=ct8R3mKg8CrEFpJuOQ8NTGFp+0gb8s/MPid85HI+q+hhE0BlG4P+U3mXQMIUDhAzaj
         iyUqbthHRr/jUjXV1qFWDdkpAH94jsqYXj/M4q63INKWFJZNr49M+EpLDapT4U7DOQb1
         a4S2IGYdinelInPsIiJJvhPrzty2UyRV3q8DxAA3zSCmgFYvlI7JXkNF8RNgxm5xiJTy
         PJy6bgdjEzW5QOKGfTOU+F80vwkOx4+WKd5d/kjOl1FG2+UiHqGnMX9n2szf4eSHoASQ
         LlPAvv6myMaQSCyakg2bYg2yPsZwhxYfu0CeTk0B45MJStf5F68L+d/HUs6g4nHiudw3
         lMYw==
Subject: [PATCH 3/6] bib/swtools: Add refereneces to PowerPC atomic RMW fixes
References: <4ae0f35c-d968-0a34-2d93-32f395d90d9a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e9e0d1cf-d497-31c5-6890-fdbdd8a1ffa1@gmail.com>
Date: Sat, 28 Sep 2019 11:01:34 +0900
MIME-Version: 1.0
In-Reply-To: <4ae0f35c-d968-0a34-2d93-32f395d90d9a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 8db4e623387758479ffcf2ba1c50587f3acef283 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 27 Sep 2019 21:56:39 +0900
Subject: [PATCH 3/6] bib/swtools: Add refereneces to PowerPC atomic RMW fixes

BenjaminHerrenschmidt2011:powerpc:atomic_return is the commit
replacing "isync" with "sync".

Paulmck2015:powerpc:value-returning-atomics points to an email
thread on the use of "lwsync".

BoqunFeng2015:powerpc:value-returning-atomics is the commit
replacing "lwsync" with "sync".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/swtools.bib | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/bib/swtools.bib b/bib/swtools.bib
index 55356664..c9c159b1 100644
--- a/bib/swtools.bib
+++ b/bib/swtools.bib
@@ -197,6 +197,17 @@
 ,keywords = {compiler optimizations, relaxed memory models, semantics}
 }
 
+@unpublished{BenjaminHerrenschmidt2011:powerpc:atomic_return
+,Author="Benjamin Herrenschmidt"
+,Title="powerpc: Fix atomic\_xxx\_return barrier semantics"
+,month="November"
+,day="16"
+,year="2011"
+,note="Git commit:
+\url{https://git.kernel.org/linus/b97021f85517}"
+,lastchecked="August 7, 2019"
+}
+
 @unpublished{RexBlack2012SQA
 ,author="Rex Black and Capers Jones"
 ,title="Economics of Software Quality: An Interview with {Capers} {Jones}, Part 1 of 2 (Podcast Transcript)"
@@ -884,6 +895,28 @@ Michalis Kokologiannakis"
 ,note="\url{http://www.rdrop.com/users/paulmck/scalability/paper/Validation.2016.04.06e.SpecMtg.pdf}"
 }
 
+@unpublished{Paulmck2015:powerpc:value-returning-atomics
+,Author="Paul E. McKenney"
+,Title="Re: [PATCH tip/locking/core v4 1/6] powerpc: atomic: Make *xchg and *cmpxchg a full barrier"
+,month="October"
+,day="14"
+,year="2015"
+,note="Email thread:
+\url{https://lore.kernel.org/lkml/20151014201916.GB3910@linux.vnet.ibm.com/}"
+,lastchecked="August 7, 2019"
+}
+
+@unpublished{BoqunFeng2015:powerpc:value-returning-atomics
+,Author="Boqun Feng"
+,Title="powerpc: Make value-returning atomics fully ordered"
+,month="November"
+,day="2"
+,year="2015"
+,note="Git commit:
+\url{https://git.kernel.org/linus/49e9cf3f0c04}"
+,lastchecked="August 7, 2019"
+}
+
 @misc{PeterZijlstra2016aLKMM
 ,author = {Peter Zijlstra}
 ,title = {{[tip:perf/urgent]} perf/core: Fix sys\_perf\_event\_open() vs. hotplug}
-- 
2.17.1


