Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HOSJmhoHQWEL/gpzFa+gvmpDql13An3NLlnOsfTfIyE=;
 b=LsyT8fduCCz6C1ojRXBJS2b5W6LWHwRk57e5grqf75J7mD8/HuczXnO0AWQVbEz+v9
 GBxbIAqYQlGH+N38bD35qJ2Iffsl80Z/xVPkfMCyIGaAtAZeaIOHcxf9FDiqZsnN260/
 VsEaW0D5hViVcW19cmt+j1m31E8CbHSr4VD3eG3P2gQdRA28HTc1f8TTMvb6yoTtbAIi
 9HrbY2emZM4NuzXApf3OsXYWIC4NIlgSRVFxxk76IzjFmMAMFxFfS6mc17a01TUMw/6m
 zZqq2YXhyT0dMWZd2xo/BJZOGk7VIiwvh4inpqKDgP6NPxlzSacKwj2nVWXLTawpya+U
 ZeKg==
Subject: [PATCH 1/4] perfbook.tex: Modify definition of \nbco{}
References: <01efa9e6-095c-2db8-2a93-e07ffa48b7d6@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b867402d-ad31-c430-fc02-b0ae0531a85a@gmail.com>
Date: Mon, 24 Apr 2017 08:53:13 +0900
MIME-Version: 1.0
In-Reply-To: <01efa9e6-095c-2db8-2a93-e07ffa48b7d6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c4f162ce5436bf0105d81cd012f11c4a30691683 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 22 Apr 2017 00:10:24 +0900
Subject: [PATCH 1/4] perfbook.tex: Modify definition of \nbco{}

It turns out that \nbco{} can't hold "#" character.
Modify its definition to use the combination of a \co{} variant
and \hbox{}.
Also add a macro named \qco{} which has quotation marks around
\nbco{}.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/perfbook.tex b/perfbook.tex
index 58b0cd2..2de83f0 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -111,7 +111,8 @@
 \makeatother
 % ---  End of workaround for Fedora 23 Texlive bug
 \newcommand{\co}[1]{\lstinline[breaklines=true,breakatwhitespace=true]{#1}}
-\newcommand{\nbco}[1]{\hbox{\texttt{\detokenize{#1}}}} % no break lines for short snippet
+\newcommand{\nbco}[1]{\hbox{\lstinline[breaklines=false,breakatwhitespace=false]{#1}}} % no break lines for short snippet
+\newcommand{\qco}[1]{``\nbco{#1}''} % \nbco with quotation marks
 \newcommand{\tco}[1]{\texttt{\detokenize{#1}}} % for code in tabular environment
 % \tco{} will break at spaces but not at underscores
 \newcommand{\nf}[1]{\textnormal{#1}} % to return to normal font
-- 
2.7.4


