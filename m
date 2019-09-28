Return-Path: <SRS0=II6t=XX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UE+bJZgGUd3YQEjhzNDhaw7LQwMAYEeYZ07hh8mWFMA=;
        b=DL7moL2YIdXMMjQsjsOOqqcylRP9XwhYmy2F4B6eQdd+Ggk/VQHLsafmkI38hveHc9
         7qhbvi8JxguTMpeH/HWGUkCtadpnsGm01bwYomh39VQcNcE3eJArjNMdh+I6MQe7zc3m
         rgstgKOmKXcqYq3wX+CeUOlQPd15qJRPVK2F3+y78HXzFFCZ8cZYfmb9Ieq3FGsZfxSS
         KEFCoWScddoqJYHGTBP76+3pJHhPDMVaJBjipxMlmKexPYGY3PYibUD9A9/2Fcr7WQ3K
         u45RXWZaTbxEzlHEXiFNuMN51C23zzrUTMmEEJqZsPBZzwgr0VEznUFAMi4+gkz8PC6U
         LTKQ==
Subject: [PATCH 1/6] dyntickrcu: Fix trivial typo
References: <4ae0f35c-d968-0a34-2d93-32f395d90d9a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c4d2f6e2-030d-a5f7-bc0f-3683e4e9bd1b@gmail.com>
Date: Sat, 28 Sep 2019 10:57:39 +0900
MIME-Version: 1.0
In-Reply-To: <4ae0f35c-d968-0a34-2d93-32f395d90d9a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6030baea7bd1226024265db45efd771dacf430d3 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 21 Jul 2019 17:05:21 +0900
Subject: [PATCH 1/6] dyntickrcu: Fix trivial typo

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/dyntickrcu.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 4b7a8ade..a7dd2d74 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -1189,7 +1189,7 @@ This effort provided some lessons (re)learned:
 	a need to re-think your design.}
 \end{enumerate}
 
-To this last point, it turn out that there is a much simpler solution to
+To this last point, it turns out that there is a much simpler solution to
 the dynticks problem, which is presented in the next section.
 
 \subsubsection{Simplicity Avoids Formal Verification}
-- 
2.17.1


