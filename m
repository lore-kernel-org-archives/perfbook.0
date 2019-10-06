Return-Path: <SRS0=rne+=X7=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Zok94GvfyOdCmdLXtRmV+QmxjW8RNTB5kJq9s6G6g8E=;
        b=F8q6DeqxjfBhoJQ2ZW3x/Y/9iWtGq0LOLgFBKhdc1198U7rJiNWvnG9y6kO0k7tEWn
         jGjtILM1+WjIb42qaz+7+fAo3rZ1vtYGiqCGlqwT5AxDk8KHRamKIPr72B2fBhHk4W6E
         R0YTbDkl+BRLAHrMHt7aTuBQYg4cS22XyyuqYNJvY3xJxH/OwI23o5W3vRVFXyUNRvYf
         WPtF9Z64Od2psUKtXbuBg/MybyL0lfHbq4PIfbHy8QxqxEmeYkEtUKJm43iqLOeOgxse
         tBu/hCZ+m2uFsbaWDy+R93HQ76vVpXq/yHx/kMtOS6R1u092Y7Kr7X7oxEF6g91hWqDW
         MQsA==
Subject: [PATCH 3/3] Define '\clnrefthro' for 'lines~m through~n'
References: <dd51b8e0-71b8-0214-a6a7-d48988462f52@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <708a3814-d2e2-bb46-9b42-8dfaa3cbe3f9@gmail.com>
Date: Mon, 7 Oct 2019 00:33:32 +0900
MIME-Version: 1.0
In-Reply-To: <dd51b8e0-71b8-0214-a6a7-d48988462f52@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7a614253ca281565945b077b75a463d44b698968 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 7 Oct 2019 00:05:19 +0900
Subject: [PATCH 3/3] Define '\clnrefthro' for 'lines~m through~n'

Use the macro in a matching pattern in dyntickrcu.tex

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Paul,

I failed to update the title of this patch before generating the
cover letter. This patch has the amended title. Manual submission of
patches by a mailer helped this time. ;-)

Please ignore the discrepancy of the titles.

        Thanks, Akira
--
 formal/dyntickrcu.tex | 2 +-
 perfbook.tex          | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 7b7c3909..7f0c6ac2 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -293,7 +293,7 @@ void rcu_irq_exit(void)
 \Clnref{chk_flg} checks to see if the \co{rcu_update_flag} is
 non-zero, returning immediately (via falling off the end of the
 function) if not.
-Otherwise, lines~\lnref{dec_flg} through~\lnref{vrf_even:e} come into play.
+Otherwise, \clnrefthro{dec_flg}{vrf_even:e} come into play.
 \Clnref{dec_flg} decrements \co{rcu_update_flag}, returning
 if the result is not zero.
 \Clnref{verify} verifies that we are indeed leaving the outermost
diff --git a/perfbook.tex b/perfbook.tex
index 06019496..e40b1292 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -205,6 +205,8 @@
 \newcommand{\Clnref}[1]{\clnrefp{#1}{Line}}
 \newcommand{\clnrefrange}[2]{lines~\lnref{#1}--\lnref{#2}}
 \newcommand{\Clnrefrange}[2]{Lines~\lnref{#1}--\lnref{#2}}
+\newcommand{\clnrefthro}[2]{lines~\lnref{#1} through~\lnref{#2}}
+\newcommand{\Clnrefthro}[2]{Lines~\lnref{#1} through~\lnref{#2}}
 
 \begin{document}
 
-- 
2.17.1

