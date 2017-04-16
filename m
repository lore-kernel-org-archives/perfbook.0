Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QWZd+DHp+Fzorb5gSE4fpexI78FFnq1IA0T1ErVgYU8=;
 b=JHvpLXxsSqMWF+huyWgJW6wCxpj6+b2WNROFW7rT++bE0JNHUDRSjgeeCJaUfcTfjS
 FI/IUsSqERBM3NfDpONNUQKyTr/ftJcSR5dXvih4aRqI+QpCeMzhpJRUTcOy0KKOXV92
 GW+IOyXReqyMFxW2q1qNRm4xnOGFLM6PmD6xHoAI54/QwTWUt8XFNt8Uv/75eT3hqviT
 W8N8be24EgJHb+u68tPzmV93YsJkADq3WjTXNyVawGFqSKEoBmLCw5JTOfcryf6S5N/1
 /IwZU7aC0ap0c3PS/x/QJ1dOG1FLOxTszvIul4ELcK6d/NrsFaSnyGqoAvsKJ8rSjA9S
 dyFg==
Subject: [PATCH 02/14] advsync: Substitute READ_ONCE()/WRITE_ONCE() for
 ACCESS_ONCE()
References: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4da119c2-982d-7e25-7ef5-34371976a237@gmail.com>
Date: Mon, 17 Apr 2017 07:14:18 +0900
MIME-Version: 1.0
In-Reply-To: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ca4c666a7c30440610ce148f73960c2e21030a56 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 15 Apr 2017 23:41:35 +0900
Subject: [PATCH 02/14] advsync: Substitute READ_ONCE()/WRITE_ONCE() for ACCESS_ONCE()

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index d82a968..173380a 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -490,7 +490,7 @@ CPUs' accesses are to one single variable.
 In this single-variable case, cache coherence guarantees the
 global ordering, at least assuming that some of the more aggressive
 compiler optimizations are disabled via the Linux kernel's
-\co{ACCESS_ONCE()} directive or C++11's relaxed
+\co{READ_ONCE()} and \co{WRITE_ONCE()} directives or C++11's relaxed
 atomics~\cite{PeteBecker2011N3242}.
 In contrast, if there are multiple variables, memory barriers are
 required for the CPUs to consistently agree on the order for current
-- 
2.7.4


