Return-Path: <SRS0=OGBw=6K=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MmWvlNoCFHK7O8jl78vq35I91E5ERz30/fXPOQbwVCI=;
        b=jjdhuiEniHJws4EgRE7+0g7cZIegl2exiZItp2kztgOlfc7jyKnQyTjVx/DQUuRR7l
         NOZhl54NLJt9ZnkOHLTeCYq6pEomiBOY3a8dQyLMFiUbTyYbV3OS4bdBDqAXGAs4jteG
         HU/SEnBGNoUKknhhG4dHB9V78GE0jcCEP2O71eeaKzrthymxvgelyLKetFo7gcjgzGMp
         WH/V1iUsRPRlPwT6dG/ueQsH7+P+BIWMdef1yVBDsCTlIhOsw5tiv8tXTvsVSywZifzk
         IhJKxllZIhyMsMSu0mP6XO668z9rc8tK9CTYxNGYzOCI27ZsEbhw5uZkUWUCPPJEXNQk
         hV/A==
Message-ID: <44251e0a-2617-361e-e61c-4dfefb5ae284@gmail.com>
Date: Tue, 14 Feb 2023 19:09:39 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 4/4] toolsoftrade: Fix QQz macro in QQz series
Content-Language: en-US
References: <8f565979-bba0-bab1-7c8e-ebc76c2b4e65@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <8f565979-bba0-bab1-7c8e-ebc76c2b4e65@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>, Leonardo Bras <leobras.c@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Final QQz in a QQz series start from "\QuickQuizE{" rather than
"\QuickQuizM{".

This typo resulted in an extra "," in the anchor box:

    +----------------------+
    | QQ 4.20, 4.21, 4.22, |
    +----------------------+

Fix it.

Fixes: a39fae0f30a9 ("treewide: Use macros for consecutive quick quizzes")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index fee34ae8a1df..8c9384049e75 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -947,7 +947,7 @@ in fact degraded by about 10\,\% from ideal.
 	sections are described in \cref{chp:Deferred Processing}.
 }\QuickQuizEndM
 %
-\QuickQuizM{
+\QuickQuizE{
 	The system used is a few years old, and new hardware should
 	be faster.
 	So why should anyone worry about reader-writer locks being slow?
-- 
2.25.1


