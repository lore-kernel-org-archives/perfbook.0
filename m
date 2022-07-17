Return-Path: <SRS0=njsb=XW=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=38sEIW8CnRav9omO5DSHX552YRTyfabqycOaKceenKo=;
        b=bftLexlDkTFvp1M4lXr/117+A/x3YMXSPiHMhwEJWkBLgM7RaAmZTlFFlgV+pwoG3V
         KAA02necH1VdBA8NzVzK9S9mM9ITYNLCaxzWGTNDs6pPYkRY5sbUYWyL2LYnElzlYVDm
         mh/LjzLBNPyBYCX3oKdaCcZOzOQncjQrKj+bY4jmQLfgd1XB4Rf20zN1p3Fsgdj4FuC9
         qmqf/ANHGZDWHBI39WWKL84MfL++wu10kwduL3ZYDwSY+VTtVMcKG4B0r46eqcdIiSNH
         wrHbsTd33OpXoG8zI5OLMO4Lxua0GGTzf8uXh8ccRUjy84WqJLvx82L5REnoFICEXc8C
         l/mg==
Message-ID: <a3b49e75-590b-9346-96e1-90d7cf5c87fe@gmail.com>
Date: Sun, 17 Jul 2022 13:11:03 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 2/2] SMPdesign: Fix typos
Content-Language: en-US
References: <c784e9e1-7cf5-bb7e-18e1-4aa7ae7665ef@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <c784e9e1-7cf5-bb7e-18e1-4aa7ae7665ef@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
I'm not 100% sure these are the right fixes.
Sending this one in the hope of getting Paul's attention.

        Thanks, Akira
--
 SMPdesign/SMPdesign.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index 4d93c6e72f0b..05b86ec7271b 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -260,7 +260,7 @@ of time during which no CPU owns this hash table.
 
 \QuickQuiz{
 	``Partitioning time''?
-	Isn't that is an odd turn of phrase?
+	Isn't that an odd turn of phrase?
 }\QuickQuizAnswer{
 	Perhaps so.
 
@@ -593,7 +593,7 @@ Another important instance of data ownership occurs when the data
 is read-only, in which case,
 all threads can ``own'' it via replication.
 
-Where data locking partitioned both the address space space (with one
+Where data locking partitions both the address space (with one
 hash buckets per partition) and time (using per-bucket locks), data
 ownership partitions only the address space.
 The reason that data ownership need not partition time is because a
-- 
2.25.1


