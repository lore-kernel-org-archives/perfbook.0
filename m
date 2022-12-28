Return-Path: <SRS0=RLd0=42=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGnSiQrvtaC1KpMqtOR9tdD/EHUXzvmDh6lm088zr8M=;
        b=hjpHrdST8mjuUwzzCGnJsSqBGgDUcVIp8XraX13TBagw6J9WjcUlrjISi2s3LJM0eY
         JyZYuwb06crAYhUtBXw4ixJUbu4LoKtPyS22EFcgnlQ3YuTk4oT1iM4qHCehSrHDhHsK
         JNu+Kvlt94scePuHR6zGQnZM84IrUiE33SujfV40efUEQ8oWp/6M724iOBtPfplC0oei
         hYRBZ84psi0VHBsoZqkM9YQzt7vZbwk+Qq0nkqDZWy08/cU5INa5gGq4EuoDCriIcGML
         1e1ZDoMym2ll0dl5G2goaIVQHhSv4J02fsSbR6VLTV0Gk1lnqJvJy/Byti2qkJn2VabZ
         /12g==
Message-ID: <97e4d950-10ce-1320-14e6-37e3c79a8870@gmail.com>
Date: Wed, 28 Dec 2022 21:12:30 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] Stick to LaTeX2e glossaries packages
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Commit 55c6bfdbfd44 ("Stick to mfirstuc v2.07") added a rollback
option to the mfirstuc package.

However, release note of glossaries-extra v1.49 [1] mentions related
releases:

    This release is part of a set of inter-connected releases all
    dated 2022-10-14: bib2gls v3.0, glossaries v4.50, mfirstuc v2.08
    and glossaries-extra v1.49. If you update glossaries-extra, make
    sure you update glossaries and mfirstuc as well (and bib2gls, if
    you also use that).

, which suggests that sole rollback of mfirstuc might break
in the future.

To be safe, let's rollback related packages all together.

The glossaries package needs to be loaded in front and needs
options to be consistent with the "acronym" option and the
(slightly different) default behavior of glossaries-extra.

Link: [1] https://www.ctan.org/ctan-ann/id/mailman.1406.1666295591.3715.ctan-ann@ctan.org
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index d5383f07c5a6..2c14114e246d 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -82,8 +82,11 @@
 \usepackage[all]{hypcap} % for going to the top of figure and table
 \usepackage{mfirstuc}[=v2.07] % v2.08 or later is not compatible with our
                               % indexing macros
-\usepackage[acronym]{glossaries-extra}[2020/02/13]
-\usepackage[longragged]{glossaries-extra-stylemods}
+% rollback glossaries related packages as well
+\usepackage[toc,nopostdot,acronym]{glossaries}[=v4.49]
+\usepackage{glossaries-extra}[=v1.48]
+\usepackage[longragged]{glossaries-extra-stylemods}[=v1.48]
+
 \usepackage{epigraph}[2020/01/02] % latest version prevents orphaned epigraph
 \setlength{\epigraphwidth}{2.6in}
 \usepackage[xspace]{ellipsis}

base-commit: e586ea257972bb2bb5b7e378fd4ddf6ffbfe8318
-- 
2.25.1

