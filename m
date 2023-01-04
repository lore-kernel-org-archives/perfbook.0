Return-Path: <SRS0=Y4Pl=5B=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fBCK/du5rbKNirojzPSpVLW8ByFrPUQZ2UqV9JaCrVQ=;
        b=PmL4yptlRgY8XBTlyrtZuqyvLNeF0ueTIpJrw9LmEU7Pjuezjv39T3B7fJlNkShNOx
         vN86BmGUQdlBAtkgWvmJRX0YYYTTF8CLCG5YuimzFR01SR2XtaG2MhVuoo4OD0N1pvzh
         tDSNlJUN2L93SgQAh6o+1h/RJdOqRweuf4Xa7feju+HxXjxkGPtnYz0vz42xaJywF3Cz
         vj057V7LvwY3CwDv2zlqxH10LVFZdeGhANqxPVfGwNrHGYefkqgjIO1LLmnV2pEgTvDB
         Zq8XBYp2z6MtWlOKv1E0TfJnJzNicdNAeUxPQifh/nNSABoFs81acn4FmrBCv0SLO6VZ
         qktg==
Message-ID: <1a838ca5-c862-35b6-e69c-a8f1c6dea61c@gmail.com>
Date: Wed, 4 Jan 2023 18:35:15 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 3/3] Use Biolinum font family for epigraph
Content-Language: en-US
References: <a6918105-fa03-7e22-7f66-69d3e097888e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <a6918105-fa03-7e22-7f66-69d3e097888e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Italic shape of the TeX Gyre Termes (Times Roman clone) family doesn't
look nice in epigraphs, especially viewed on low resolution displays.

Instead, use the Biolinum font family [1] from the libertine
package [2] which is widely available as a TeX Live package.

Biolinum is actually sans-serif, still it resembles serif fonts.

It reasonably suits both the default serif font and the sans-serif
font (Helvetica clone).

Load of textcomp in front with the "full" option is a workaround
needed for earlier TeX Live distro packages, for example that of
Ubuntu Focal and Bionic.

Links: [1] https://tug.org/FontCatalogue/biolinum/
Links: [2] https://www.ctan.org/pkg/libertine
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 97cdd0d24af9..13dd88b32d94 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -12,10 +12,11 @@
 % standard packages
 
 % A more pleasant font
+\usepackage[full]{textcomp} % use symbols in TS1 encoding
+\usepackage{biolinum}
 \usepackage{lmodern}
 \usepackage[T1]{fontenc} % use postscript type 1 fonts
 \usepackage[defaultsups,helvratio=0.9]{newtxtext} % use nice, standard fonts for roman
-\usepackage{textcomp} % use symbols in TS1 encoding
 
 % Improves the text layout
 \usepackage{microtype}
@@ -568,7 +569,7 @@
 \newcommand{\rt}{\mbox{-rt}} % to prevent line break behind "-"
 
 \let\epigraphorig\epigraph
-\renewcommand{\epigraph}[2]{\epigraphorig{\emph{#1}}{\scshape\footnotesize #2}}
+\renewcommand{\epigraph}[2]{\epigraphorig{\biolinum\emph{#1}}{\biolinum\scshape\footnotesize #2}}
 \IfEbookSize{
   \newcommand{\Epigraph}[2]{\epigraph{#1}{#2}}
 }{
-- 
2.25.1


