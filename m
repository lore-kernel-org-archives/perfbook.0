Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0Ygvv4AZkLJr6tP74wv/7EzWoQoQrizwYx43rF19Ol4=;
        b=LC9b1KecEtonWZ7z5H8fWoAczWG4HYMZdqzGvz7e9ojQcNi5YXGJCbhTc+2oAjwU7C
         ZOJRFxWEUhqiYPeb7s9zXo4lDTLlNpfTgEIJLkIvjVKaOOjNzJhP7f8NEa/tD0lYPrxR
         TN7IqlA7YXqsiUNeHei/2+9AF4FUZbJKYn6QWv4HvDDUk27fpO+J5I+ECyytduyaxs/4
         /jPK7VsrtsJC/6iNu1bgzuKl0PMcw3vEYy3MmxjVTRGSYO16IgBd2z9YhTLRXGrs+n4a
         FP+zOHKrfCZt2ASGR+A7EsVSHcIfknu7gVKglpxaoAXFMXqldC2E4UeKWZydD2IMgrNR
         8b5Q==
Subject: [PATCH 2/2] defer/rcufundamental: Fix typo of \ref{} command
References: <715cbffc-8d06-5d3c-2a85-f45f87304b28@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <91149105-ee89-bf5b-0991-21ea93fc00b3@gmail.com>
Date: Mon, 28 Jan 2019 23:33:53 +0900
MIME-Version: 1.0
In-Reply-To: <715cbffc-8d06-5d3c-2a85-f45f87304b28@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 18561e12c81e3374250eafc8e35293ea4319a238 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 28 Jan 2019 23:22:32 +0900
Subject: [PATCH 2/2] defer/rcufundamental: Fix typo of \ref{} command

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

In case this hunk should conflict with your update, please hand apply it;
or just ignore it if you have already fixed the typo.

        Thanks, Akira
--
 defer/rcufundamental.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index 99fabe2..070f932 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -128,7 +128,7 @@ However, on other architectures, \co{rcu_dereference()} typically
 emits a single load instruction, just as would the equivalent single-threaded
 code.
 The coding restrictions are described in more detail in
-Section~/ref{sec:memorder:Address- and Data-Dependency Difficulties},
+Section~\ref{sec:memorder:Address- and Data-Dependency Difficulties},
 however, the common case of field selection (\qco{->}) works quite well.
 Software that does not require the ultimate in read-side performance
 can instead use C11 acquire loads, which provide the needed ordering and
-- 
2.7.4


