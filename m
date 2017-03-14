Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=pq40Zw4qQLc8ErFC+82qfJe3acsfu/clBrZ5Q3l3AL8=;
 b=YTxT/qkR5kp+pBWjB9yueOlNKIVwV65gcwGMzjjtb5+QdzY4VZv8kehjhkygu7grL5
 EpjjqNcl92ESgAQ06AL5ZN3yIKfBIk9n3oKAPBsCuObENSjIRjdgqYDYNwAITWrfewsc
 hIcszbPCgOUZLMnAJgu8HkLopRXvFO4nO41gYoDqib2skHJ/lFAyEBik8q8bUeKwaBu2
 VLCAQs9RvPw7QGqJDseS6vZf/A+AOvX0AnbgFswznN4WSrrTGY670Dqs0WDixAkE4cgN
 iYZZMGrH1uRTR1CklzjYCS3AjhTFTiiY6O5EQbEffgdWwHnNf3Sv0cP/tykxXrWhq2Q9
 jR6g==
Subject: [PATCH v2 5/6] advsync/memorybarriers: Reference by Figure label
References: <b0933155-7c2b-d271-c2a4-8cf78b133193@gmail.com>
 <c00849e8-cff8-2db0-d14a-d46593766761@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4be7caea-4c83-7a6e-042f-3aa46ca0bd9f@gmail.com>
Date: Tue, 14 Mar 2017 21:42:20 +0900
MIME-Version: 1.0
In-Reply-To: <c00849e8-cff8-2db0-d14a-d46593766761@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e495d83986561ebddebc268abdd82284060f1a50 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 13 Mar 2017 20:50:12 +0900
Subject: [PATCH v2 5/6] advsync/memorybarriers: Reference by Figure label

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 98f7787..85e9162 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1135,7 +1135,8 @@ appears to be maintained.  Similarly, the compiler may also arrange the
 instructions it emits in any order it likes, provided it doesn't affect the
 apparent operation of the program.

-So in the above diagram, the effects of the memory operations performed by a
+So in Figure~\ref{fig:advsync:Abstract Memory Access Model},
+the effects of the memory operations performed by a
 CPU are perceived by the rest of the system as the operations cross the
 interface between the CPU and rest of the system (the dotted lines).

-- 
2.7.4


