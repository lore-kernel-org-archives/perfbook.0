Return-Path: <SRS0=7ZAc=SC=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fuVwo6Y14fG3Y3bx/8SZYYE+QDU3uzS0CFlxmmPEZOo=;
        b=hy72mlbM2gsEmG8b6HRdtdTbUjo5c9UHqlfNcEnhre9fIsADtPAkNfKcfsUUsftls1
         RHwk+zHweloNeGX+n/1kOxOJl0Rpt1b9W5sTVFAGookKInu+C/2eeUU4Z3qaJ+T7DSz4
         3rLVzqVd7il/91S7DvVfJqptaWAC+ylfBWJOco7b+x0rhlgykq9KNrYTx/YGWjxqRdNq
         4fbuljvbK+RA84S3H9ebAcfOCPWAkNi82TtygCu+h+jT+YymV+WId5nfDMlaX6phmspo
         EkbICQAJEjqKh28YzwrgfRLPCvr8o3vANKv0Hm01HENnomzTBezcrIXasBkVbnUkGFTL
         Upig==
Subject: [PATCH -perfbook 4/6] index: Add prenotes of legends
References: <014dcadf-e5ff-3a73-3b5a-a7951375d642@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3a27202e-917a-1624-bd81-cc9dcc93bafe@gmail.com>
Date: Tue, 18 Jan 2022 19:56:15 +0900
MIME-Version: 1.0
In-Reply-To: <014dcadf-e5ff-3a73-3b5a-a7951375d642@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Also shorten indicators of "(k historic)" and "(userspace RCU)" to
"(kh)" and "(ur)" respectively.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index ff257bcc..188a300d 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -238,9 +238,9 @@
 \newcommand{\apig}[1]{\hlindex{\co{#1}}\sindex[api]{#1@\co{#1}\categapi{g}}}
 \newcommand{\apipx}[1]{\hlindex{\co{#1}}\sindex[api]{#1@\co{#1}\categapi{px}}}
 \newcommand{\apik}[1]{\hlindex{\co{#1}}\sindex[api]{#1@\co{#1}\categapi{k}}}
-\newcommand{\apikh}[1]{\hlindex{\co{#1}}\sindex[api]{#1@\co{#1}\categapi{k historic}}}
+\newcommand{\apikh}[1]{\hlindex{\co{#1}}\sindex[api]{#1@\co{#1}\categapi{kh}}}
 \newcommand{\apipf}[1]{\hlindex{\co{#1}}\sindex[api]{#1@\co{#1}\categapi{pf}}}
-\newcommand{\apiur}[1]{\hlindex{\co{#1}}\sindex[api]{#1@\co{#1}\categapi{userspace RCU}}}
+\newcommand{\apiur}[1]{\hlindex{\co{#1}}\sindex[api]{#1@\co{#1}\categapi{ur}}}
 \newcommand{\api}[1]{\hlindex{\co{#1}}\sindex[api]{#1@\co{#1}}}
 \newcommand{\apialtc}[2]{\hlindex{\co{#1}}\sindex[api]{#2@\co{#2}\categapi{c}}}
 \newcommand{\apialtg}[2]{\hlindex{\co{#1}}\sindex[api]{#2@\co{#2}\categapi{g}}}
@@ -664,8 +664,13 @@
 }
 \printglossary[type=\acronymtype]
 \phantomsection
+\setindexprenote{\footnotesize Note on page number styles:
+  \textbf{Bold} indicates fair amount of discussion.}
 \printindex
 \phantomsection
+\setindexprenote{\footnotesize (c):~Cxx standard, (g):~GCC extension,
+  (k):~Linux kernel, (kh):~Linux kernel historic, (pf):~perfbook CodeSamples,
+  (px):~POSIX, (ur):~userspace RCU}
 \printindex[api]
 \IfEbookSize{}{
 \restoregeometry
-- 
2.17.1


