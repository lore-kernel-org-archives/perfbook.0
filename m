Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=y8nTF3WfFRQFBxTE849f4AmMaCJLGudVdozFiMDJTd4=;
        b=n09u4y7Kl/4wXSUyuzuLdFaxadjQUkWA3TgELjg3hf851WO5KJNK2NCSOocgoBWFTb
         PUkZzgJQx7zGY5ArRv0+22MG+IUnI8/aWYxFg/3VE3c7/LjadGnyxWlQ1iKN2NtItSYN
         vOWyKwVhoN6SaDvIQrCoSEFJricZWx7ds6UlSOlDB60H0TazPXDLZqt5dshVAyKlpl7z
         d83vcayoV+Gh8UmOYIL2ISqqLUzupZ4hLxZ2r6QbG+gOCP7fIBHj4Tg1sYkEWLTfSUpv
         dJlw/xj9YYriK5fuFPIXynU8zSZ9TTEjH/RYDO86Gr+QKjWEWdHGxPb62+tT9tuecYRC
         7W3g==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] memorder: Fix two trivial typos
Date: Tue,  2 Apr 2019 09:14:57 +0900
Message-Id: <20190402001457.31848-1-sj38.park@gmail.com>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 memorder/memorder.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 1649ce9..bb380ad 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -3125,7 +3125,7 @@ Sections~\ref{sec:toolsoftrade:A Volatile Solution}-\ref{sec:toolsoftrade:Avoidi
 	cause the compiler to discard a previously loaded value from
 	its register, and then reload it later on.
 	Invented loads can be prevented by using \co{READ_ONCE()} or by
-	enforcing ordering as callout out above between the load and a
+	enforcing ordering as called out above between the load and a
 	later use of its value using \co{barrier()}.
 \item	Stores can be invented before a plain store, for example, by
 	using the stored-to location as temporary storage.
@@ -3160,7 +3160,7 @@ optimizing your parallel algorithm out of existence.
 Compilers are starting to provide other mechanisms for avoiding
 load and store tearing, for example, \co{memory_order_relaxed}
 atomic loads and stores, however, work is still
-needed~/\cite{JonathanCorbet2016C11atomics}
+needed~\cite{JonathanCorbet2016C11atomics}.
 In addition, compiler issues aside, \co{volatile} is still needed
 to avoid fusing and invention of accesses, including C11 atomic accesses.
 
-- 
2.10.0

