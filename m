Return-Path: <SRS0=7eUo=ZY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+9Xcee9sDtIJ+frfyTL8tENiZMb9xhVxqSwAyfg5R18=;
        b=IwyAWMbUstAOIp3S6sa4tGQBVgEwfmYLGD6oHts3PwnImEB4ie01D+pT/fZvT9LkgP
         CPXFR3fAFzTRDF+1DgBTfl4WgtHU7ha/wtIwjQJFr5rU0ZoYPLM3NYzEn/Q4kPeWKi92
         Qvk5C9w4tx0+RVvpZZVX3KRN7BbsPmiX5geN7g8f4KRppI535z2WxUXa1uCTosmFdazW
         g/V8Kwx6GUk4UjdOln05zZ1q63M3ayQun8xsu4VgAje0h11JYvMYFPw+c7nz1I8WoSnM
         gVkFcF3v4cjRsnt0kSRBf0P6SGdCqvzpj5Q3gDtzyXd0F2HGK0GlU30rf8i3diBsJ0OM
         dWqg==
Subject: [PATCH 5/6] styleguide: Clarify newline-after-sentence rule is for
 LaTeX source
References: <bd2bcae7-bfde-241f-281c-832615d1c9c0@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b7db0d20-af11-1749-feb8-e8726978aa68@gmail.com>
Date: Tue, 3 Dec 2019 00:21:16 +0900
MIME-Version: 1.0
In-Reply-To: <bd2bcae7-bfde-241f-281c-832615d1c9c0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 5bb205a33cbd134f7d153c19efdf12fe2861c1c1 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 2 Dec 2019 21:09:53 +0900
Subject: [PATCH 5/6] styleguide: Clarify newline-after-sentence rule is for LaTeX source

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 0d68db32..8967c315 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -76,6 +76,11 @@ answers to Akira's questions regarding perfbook's punctuation policy.
   use it if doing so prevents a line break in that heading.
 \item When mentioning words, I use quotations.  When introducing
   a new word, I use \verb|\emph{}|.
+\end{itemize}
+
+Following is a convention regarding punctuation in \LaTeX\ sources.
+
+\begin{itemize}
 \item Place a newline after a colon (\co{:}) and the end of a sentence.
   This avoids the whole one-space/two-space food fight and also has
   the advantage of more clearly showing changes to single sentences
-- 
2.17.1


