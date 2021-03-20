Return-Path: <SRS0=Ggdu=IS=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zDL9lnCxSTQHlE5eIEVSL+mzqZPiVp6wojHF5SQCUJM=;
        b=X0thsZ/F1wqPc99GZpOfgjol9ty+hO7CXljHvnF3qwW9ZHRFXL+fwKLaFJMeEPQvC6
         8Ej3L8dyPgfI1KK84/m1/o8KnYvK9+b5hhJyHhsgJYLNK6n5uNQUh+dzGF82PzzktTyU
         8NNlxOLlBIDyKBRWGJaKmNXLAzqdS9nH3RKtmhPCHcGodIFCE/RF7ytwFOkYoFrGT/Cq
         pM4ZOzL9juONB5vmzCWk2UW886B/ltcdZ8muWP34PwhppiJ67u5j/lwTKNIQru2nq6ac
         I3kgTGENZy6o/y1QfqBqo4c6689lscWK/iSbWL8Zub7N+VvTzIbBAl01ndWZccP0nrWU
         O1qQ==
Subject: [PATCH 2/3 -perfbook] together/refcnt: Adjust tense with 'have
 released'
References: <85bad10b-4875-b98f-8c3d-547625460817@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8d327ffe-282a-2a04-41e2-ee3ab9bc5ffb@gmail.com>
Date: Sun, 21 Mar 2021 00:23:13 +0900
MIME-Version: 1.0
In-Reply-To: <85bad10b-4875-b98f-8c3d-547625460817@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Paul,

This is in your recent update.
The former part of "or" says "both CPUs have released ...", so the
latter part should say "(both CPUs have) exited ...", I suppose.

"or have exited" might be the right fix, but it sounds redundant
to me.  Up to you!

        Thanks, Akira
--
 together/refcnt.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/together/refcnt.tex b/together/refcnt.tex
index 829af167..599ae5f0 100644
--- a/together/refcnt.tex
+++ b/together/refcnt.tex
@@ -257,7 +257,7 @@ and any needed memory barriers or disabling of compiler optimizations
 will be provided by the hazard-pointers or RCU infrastructure.
 Therefore, if two CPUs release the final two references concurrently, the
 actual cleanup will be deferred until both CPUs have released their hazard
-pointers or exits their RCU read-side critical sections, respectively.
+pointers or exited their RCU read-side critical sections, respectively.
 
 \QuickQuiz{
 	Why isn't it necessary to guard against cases where one CPU
-- 
2.17.1


