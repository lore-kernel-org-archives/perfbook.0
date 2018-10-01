Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mePhaMU/SdzMjLoFTKrpyBdqzJQ31wryWc2VcNQi0Mk=;
        b=DdehxC1tfULipD8CMxRd+S/yy+IaHrS0RfwY+B/aLkHoX0AoVHY+NVknPA1gC/aTXc
         jyICcVpUMj57r+ouS5PLy43ueJev6vqhQkfz25MY82CJ4GEG1mqSnwlOvepoFTunsP6y
         w8EjtLpnjgTAkuRmw4eCznruzG9jYovBToRwXrqVWWMBMRhLw9GBXLExXU9lXXFxs07M
         PfnqShgIBY3eLJXbFS2qUOZUcJIx2O03BdCfw3tgMf/HJ4FkuYy3cubynx8GjMpGxXM6
         T4QH3EEnt3DBW89aRZ0LZ+ATvs+IrofK0WzcY7SSYcVtbBeA5h/Ks5mPKHMseIP9RN8/
         4Kdg==
Subject: [PATCH 4/5] Remove workaround for Fedora 23 Tex Live bug
References: <1a19dbcb-3dbb-3359-dafa-1fc8dbe4837d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f3be3f59-04fb-245a-4a68-104ca1fe97d5@gmail.com>
Date: Mon, 1 Oct 2018 22:55:22 +0900
MIME-Version: 1.0
In-Reply-To: <1a19dbcb-3dbb-3359-dafa-1fc8dbe4837d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a3df2ce37517ab16ff1ea16a1439d9895f58e761 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 29 Sep 2018 23:52:05 +0900
Subject: [PATCH 4/5] Remove workaround for Fedora 23 Tex Live bug

Fedora 23 was EOLed quite a while ago. It should be safe to remove
the workaround.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/perfbook.tex b/perfbook.tex
index 3547f64..6784771 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -152,20 +152,6 @@
   {->}{}{0\discretionary{->}{}{->}}%
 }
 %%HTMLNOSKIP
-% ---  Workaround for Fedora 23 Texlive bug
-\makeatletter
-\renewcommand\lstinline[1][]{%
-\leavevmode\bgroup % \hbox\bgroup --> \bgroup
-\def\lst@boxpos{b}%
-\lsthk@PreSet\lstset{flexiblecolumns,#1}%
-\lsthk@TextStyle
-\ifnum\iffalse{\fi`}=\z@\fi
-\@ifnextchar\bgroup{%
-\ifnum`{=\z@}\fi%
-\afterassignment\lst@InlineG \let\@let@token}{%
-\ifnum`{=\z@}\fi\lstinline@}}
-\makeatother
-% ---  End of workaround for Fedora 23 Texlive bug
 \newcommand{\co}[1]{\lstinline[breaklines=true,breakatwhitespace=true]{#1}}
 \newcommand{\nbco}[1]{\hbox{\lstinline[breaklines=false,breakatwhitespace=false]{#1}}} % no break lines for short snippet
 \newcommand{\qco}[1]{``\nbco{#1}''} % \nbco with quotation marks
-- 
2.7.4


