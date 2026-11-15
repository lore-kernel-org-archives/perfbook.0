Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776504;
	b=z0JzmPCSJ12ms94Y2cz1eY+d3spYHgulG6LPo/usUsKWnnzwd5R8PhQ7ZOL6moeMVlTA
	 5Q4zzllsqg3TY68mXXxCU8e8vsEl7mdyBuZzO5t/sD/nll/HO9PAFfC/vEb7f+6W2TpFD
	 JK6hse/xitlLq5PQFyb/UUGMkLmZbN2fqiIECLl580vKSMVea2jeKIBAh9rBI5yHc5VbU
	 MNVBx1kOPm8mDspg7PlHMp/qXEJvZp8xUGQK66++SW3LQZWJT5dO+476eZWR+69qLP907
	 Tw4CwvrZHt6ihf6FGCOxw/VRAiNBEPYJiEul/M/8V6sKx/ZZNv8WpmGnlIdBMJFX/ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776504;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pkk6BleJVSt1TavcPBxwV60HbtsN0MsqxNe1xvtPFgc=;
	b=sPdq8r111mT0JVuMprKeUMd/bvO2xiCC3kokIMTQYGwdJCpVL44OH045kE3qQrS0b4IH
	 ZMU+GLVvgs4ihp1bpurszF7OVFXkUYy6B4VbAYLfqQRbyrLlBndn6YHYTq5+ThSmToAZC
	 tFqXus/0Awf6g2VBU/ND53EFBBymNrQ7V5ybSVhcUkGOao+RMbDtuKyjpnpQ55P7qFMIU
	 Xs1f8oo9QvPFpAI1oCxd2nWXpIhccaMvejYIvuuSSH9iuSRXEpwY4Us4q0dEjWfNJgggz
	 CAIxXuVCC9wnbugfbUk6Jp2Y44Iv0ZM+cPRzyaKF303j1wXS3KMMu90xB97n0ly/EEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=fejes.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E320606A31F
	for <perfbook@vger.kernel.org>; Sun, 15 Nov 2026 21:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E320606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fejes.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37628596783so4680299eec.1
        for <perfbook@vger.kernel.org>; Sun, 15 Nov 2026 13:01:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776503; x=1795381303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pkk6BleJVSt1TavcPBxwV60HbtsN0MsqxNe1xvtPFgc=;
        b=yEDvVRkmLG6jl7vJXotOElbrLXBoRAvUCGsKWtcZxfhmZAfGPHmZH0pcbzxNYjBxq5
         VTQRU8KKC6czGkkq5Z+rRX9IPSjsbEr189Wfebso0cQ5caY1d9zR8JrX+zVpU/eHcXiB
         M6QjQYGP3if+nyarnw10xueNW+c81CDNyIPgVAWaqXOn+5Do7lBHwgVtY79MY4wpqIuq
         VhUADmrCVtbIsgpgPzBby5+qw0gytvQAfA6vSNP5Hzt+PRyaXwNkGBkURl4U/g0FpKdD
         eNGM5pB5NhR0tbTFZc6AH9d9lMOwUs55ufKi0dILz+nZoz+Iw0d10fVr4se1Ks7BlyVy
         gsmw==
X-Gm-Message-State: APuU4Z946niriLoOa4mX09erGmIQuwktHq/QXs7w/mwSYXDXf3tXvX2G
	j1aB4x00pIts2d2+QTDpIC9juo6ZoQS1zyDD2LSn2tyNinUSAG+xGKgYMLQKg8100WLf//Q0
X-Gm-Gg: AYBFou3LDZmir1FoA1bxVHOhdsH4QJaOvWxOgkVQXdscwEQPRSXqpKlaP/3qTvh40pf
	490SFLrjzmRIITLt58Vsu9UGQ7d24+lEfDDVWkPmW3/hYqf02pnBV7FQCAi/hNPLrd7UQTtoFPU
	Y+MxfkNVuBxHGTd2EwDUlO5wUkyMKHCRP4dCtTYYCR//bafKzRKnzWbkbHMpIgYq2ZY+wBk6CMY
	fxNRyD5CgOJE7U5OlKfpWqVHNl3JbeAAam4P21iXjJ+JTz2KbVrXXn64tSkovDlw8zRAydZyJ9C
	iqkGgxAlEpi9VGP6UGzHqFZxUogexQtIvMuA5O8R6kv5k8vG/pM/mekatScxwjm9MlKuESE3AdQ
	fIIRN8S98Xmq0HoMtLi+HH5dgo2ZEBGWSibLT5EhBfT+y8nvAn7KFg6vyiCUwvpuD1g5JhbGgkO
	w9rtVSoVvYFe/CzxQuGUG2U0NnHxF2MRTu/7JkmAjimQSlbT+zztAiI25r32/fz00MrKUytWg4+
	sdVcW14MWkB9LmmO8RfObiY+axOxgMnQ5sydPlVekbV8s3jgxn5U+X5CYdNRwvCXc6zVFTT1YJn
	0iftpREpzp/XcQ3lui2ANGsnlsmnV3+arNyMfMhbjqu+q139jb3Amr9rBa2CQtSpENYFhwn9EtM
	nwcD3Ap3vpdVOC2qyYqwzmq8IC/IOMTSxRoyDpmEb0AvSM1sBjDtp06ZqOsN1EpG13SnasCJ208
	AteS+k0Xq0s8O+yEPKt1SioaETTjKNYMDMBR4pu5P0X6vsjZQhpzoOL+K/5R+b
X-Received: by 2002:a05:7300:f794:b0:36e:58f3:6f0e with SMTP id 5a478bee46e88-379635648c2mr8379138eec.5.1794776502536;
        Sun, 15 Nov 2026 13:01:42 -0800 (PST)
Received: from hp.tailca3b3b.ts.net ([2001:67c:370:128:4595:f7da:56c1:448d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm26926677eec.22.2026.11.15.13.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:01:42 -0800 (PST)
From: Ferenc Fejes <ferenc@fejes.dev>
To: perfbook@vger.kernel.org
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Leonardo Bras <leobras.c@gmail.com>,
	Ferenc Fejes <ferenc@fejes.dev>
Subject: [RFC PATCH 1/7] reflow.ltx: Add LaTeX-to-HTML shims for lwarp builds
Date: Sun, 15 Nov 2026 22:01:32 +0100
Message-ID: <20261115210138.229034-2-ferenc@fejes.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115210138.229034-1-ferenc@fejes.dev>
References: <20261115210138.229034-1-ferenc@fejes.dev>
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Post: <mailto:perfbook@vger.kernel.org>
List-Help: <mailto:perfbook+help@vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
List-Owner: <mailto:perfbook+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add reflow.ltx to configure lwarp via LaTeX2e package hooks and adapt
print-oriented macros for reflowable HTML and EPUB output without
modifying existing .tex or .sty files.  It normalizes HTML containers
and anchor IDs for Pandoc, scales figures proportionally, unwraps table
and listing boxes, emits HTML equation numbers, and drops page-number
phrases from cross-references.

Signed-off-by: Ferenc Fejes <ferenc@fejes.dev>
---
 reflow.ltx | 255 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 255 insertions(+)
 create mode 100644 reflow.ltx

diff --git a/reflow.ltx b/reflow.ltx
new file mode 100644
index 00000000..022d4801
--- /dev/null
+++ b/reflow.ltx
@@ -0,0 +1,255 @@
+% SPDX-License-Identifier: GPL-2.0-or-later
+%
+% reflow.ltx -- HTML-mode shims for the lwarp reflowable (EPUB) build.
+% Input before \documentclass by perfbook-epub.tex; print builds never
+% load this file.
+%
+% Copyright (C) Ferenc Fejes, 2026
+%
+% Authors: Ferenc Fejes <ferenc@fejes.dev>
+
+\makeatletter
+\@ifpackageloaded{lwarp}{}{%
+  \AddToHook{package/fontenc/after}{%
+    \usepackage{fontaxes}%
+    \usepackage[HTMLFilename=perfbook-epub-]{lwarp}%
+    \ifbool{warpingHTML}{}{%
+      \LWR@writeconf{lwarpmk.conf}\LWR@writeconf{\jobname.lwarpmkconf}\stop}%
+    \setcounter{FileDepth}{0}%
+    \boolfalse{FileSectionNames}%
+    \booltrue{FormatEPUB}%
+    \HTMLAuthor{Paul E. McKenney}%
+    \HTMLLanguage{en-US}%
+    \RenewDocumentCommand{\usepackage}{o m o}{%
+      \IfValueT{#1}{\PassOptionsToPackage{#1}{#2}\PassOptionsToPackage{#1}{lwarp-#2}}%
+      \IfValueTF{#3}{\RequirePackage{#2}[#3]}{\RequirePackage{#2}}}%
+    \providecommand{\SetWatermarkVerCenter}[1]{}%
+    \providecommand{\bottomtitlespace}{0pt}%
+    \let\LWR@saved@l@section\l@section
+    \let\LWR@saved@l@subsection\l@subsection}%
+  \AddToHook{package/lwarp-subfig/after}{\let\@newsubfloat\LWR@orig@newsubfloat}%
+  \AddToHook{package/lwarp-enumitem/after}{%
+    \let\enit@style@unboxed\enit@style@standard
+    \let\enit@style@sameline\enit@style@standard
+    \let\enit@style@multiline\enit@style@standard
+    \let\enit@style@nextline\enit@style@standard}%
+  \AddToHook{package/booktabs/after}{\setboolean{usecleveref}{true}}%
+  \AddToHook{package/lwarp-fancyhdr/before}{\let\headrule\relax\let\footrule\relax}%
+  \AddToHook{file/glsdict.tex/after}{\input{reflow.ltx}}%
+  \makeatother\endinput}
+
+% Restore lwarp's TOC entries (overwritten by perfbook-lt.tex's \@dottedtocline)
+% and suppress hyphenation tables in HTML mode.
+\let\l@section\LWR@saved@l@section
+\let\l@subsection\LWR@saved@l@subsection
+\renewcommand{\hyphenation}[1]{}
+
+% Emit <div> instead of <main>, <section>, <nav> so Pandoc (-f html-native_divs)
+% unwraps lwarp's structural containers and splits chapters directly; drop
+% invalid EPUB3 attributes (role="note", role="math", target="_blank"); and
+% emit local #id hrefs so Pandoc resolves cross-file links to chNNN.xhtml.
+\RenewDocumentCommand{\LWR@htmlelementclass}{m o D(){} m}{%
+  \LWR@stoppars\LWR@subhtmlelementclass{div}[#2]{#4}\LWR@startpars}
+\renewcommand*{\LWR@htmlelementclassend}[2]{\LWR@stoppars\LWR@htmltag{/div}\LWR@startpars}
+\renewcommand*{\LWR@htmlrefsectionfilename}[1]{}
+\patchcmd{\LWR@subinlineimage}{\ifblank{#6}}{\ifblank{}}{}{}
+\expandafter\patchcmd\csname LWR@subhyperref code\endcsname
+  {target=\textquotedbl\_{}blank\textquotedbl\ }{}{}{}
+
+% Sanitize XML NCName characters in HTML IDs/hrefs (preserving "??" so the build
+% can detect unresolved references).
+\ExplSyntaxOn
+\cs_new_protected:Npn \pfb@cleanid #1 {
+  \str_if_eq:VnF #1 { ?? } {
+    \str_replace_all:Nnn #1 { ~ } { - }
+    \str_map_inline:nn { ?;()!/+=@`' } { \str_replace_all:Nnn #1 {##1} { - } }
+  }
+}
+\ExplSyntaxOff
+\apptocmd{\LWR@sanitize}{\pfb@cleanid\LWR@sanitized}{}{}
+
+% Drop \hbox wrappers around inline code so lwarp's inline listing tag survives,
+% and allow unescaped $ inside \lstinline (\co/\nbco/\qco).
+\AddToHook{file/ushyphex.tex/before}{%
+  \renewcommand{\nbco}[1]{\lstinline[breaklines=false,breakatwhitespace=false]{#1}}%
+  \renewcommand{\qtco}[1]{``\tco{#1}''}}
+
+\AtBeginDocument{%
+  \renewcommand{\printindex}[1][]{}%
+  \def\lst@InlineG{\lst@Init\relax\let\lst@arg\@empty\lst@InlineGJ}%
+  \patchcmd{\lst@Init}{span class=\textquotedbl{}inlineprogramlisting\textquotedbl}{code}{}{}%
+  \let\lst@DeInit\LWR@origlst@DeInit
+  \patchcmd{\lst@DeInit}{\lst@EOLUpdate}{\lst@EOLUpdate
+    \lst@ifdisplaystyle\let\lsthk@EveryPar\relax\LWR@afterendverbatim\let\lsthk@EveryPar\LWR@origlsthkEveryPar
+    \else\ifbool{LWR@verbtags}{\noindent\LWR@htmltag{/code}}{}\fi}{}{}%
+  \RenewDocumentCommand{\LWR@HTML@resizebox}{s m m}{\pfb@setigpct{#2}}%
+  \renewcommand{\epsfbox}[1]{\resizebox{\epsfxsize}{!}{\includegraphics{#1}}}%
+  \define@key{igraph}{scale}{\ifdefempty{\pfb@igwidthstyle}{\pfb@setigpct{#1\twocolumnwidth}}{}}%
+  \renewenvironment{sidewaystable*}[1][]{\begin{table*}[#1]}{\end{table*}}%
+  \let\pfb@lstcap\lst@MakeCaption
+  \renewcommand*\lst@MakeCaption[1]{%
+    \lst@ifdisplaystyle\pfb@lstcap{#1}\else\caption@ORI@lst@MakeCaption{#1}\fi}%
+  \renewcommand{\epigraph}[2]{%
+    \LWR@stoppars\LWR@htmltag{figure class=\textquotedbl{}epigraph\textquotedbl}\LWR@startpars
+    \emph{#1}\par\LWR@htmlelement{figcaption}#2\LWR@htmlelementend{figcaption}%
+    \LWR@stoppars\LWR@htmltag{/figure}\LWR@startpars}%
+  \NoIndentAfterCmd{\epigraph}%
+  \let\pfb@label\label@noarg
+  \def\label@noarg#1{\LWR@clean@arg{#1}\pfb@label{\LWR@on@arg}}}
+
+% Bibliography: avoid math in alphapf.bst labels, link citations to entries,
+% and format thebibliography as a <dl> description list.
+\AtBeginEnvironment{thebibliography}{%
+  \@ifundefined{etalchar}{}{\renewcommand{\etalchar}[1]{\textsuperscript{#1}}}%
+  \LWR@descriptionstart
+  \renewcommand{\@biblabel}[1]{[#1]}}
+\patchcmd{\@lbibitem}{\ignorespaces}{\hypertarget{cite.#2}{}\ignorespaces}{}{}
+\def\@cite@ofmt#1{%
+  \ifnumcomp{\value{LWR@linkdepth}}{>}{0}{#1}{%
+    \edef\pfb@citelink{\noexpand\hyperlink{cite.\@citeb}}\pfb@citelink{#1}}}
+
+% Scale figures proportionally to their LaTeX \resizebox/\includegraphics target
+% width (relative to \onecolumntextwidth = 4.1in, clamped to [35%, 85%]), and
+% unlink images and \path{} so they do not point to files outside the EPUB.
+\def\pfb@igwidthstyle{}
+\def\pfb@setigpct#1{%
+  \begingroup
+    \setlength{\dimen@}{#1}%
+    \count@=\numexpr\dimen@*100/\onecolumntextwidth\relax
+    \ifnum\count@>85 \count@=85 \fi
+    \ifnum\count@<35 \count@=35 \fi
+    \xdef\pfb@igwidthstyle{width:\the\count@\@percentchar}%
+  \endgroup}
+\AtBeginEnvironment{tabular}{%
+  \gdef\pfb@igwidthstyle{}%
+  \ifdef{\lockfml}{\renewcommand{\lockfml}[1]{\begin{picture}(6,8)(0,0)\rotatebox{90}{#1}\end{picture}}}{}}
+\AtBeginEnvironment{lateximage}{\boolfalse{LWR@in@multirow@par}}
+\AtBeginEnvironment{figure}{%
+  \patchcmd{\LWR@lateximage@oneimageb}{{lateximage}}{{inlineimage}}{}{}%
+  \patchcmd{\LWR@lateximage@oneimageb}{{#3}}{{width:60\@percentchar}}{}{}}
+\pretocmd{\LWR@ig@htmltag}{%
+  \ifdefempty{\pfb@igwidthstyle}%
+    {\def\LWR@igwidthstyle{width:75\@percentchar}}%
+    {\let\LWR@igwidthstyle\pfb@igwidthstyle\gdef\pfb@igwidthstyle{}}}{}{}
+\expandafter\patchcmd\csname LWR@includegraphicsb code\endcsname
+  {\LWR@href@partsanitized{\LWR@parsedfilename}}{\@firstofone}{}{}
+\LetLtxMacro\LWR@HTML@path\nolinkurl
+\LWR@formatted{path}
+
+% Numbered display math: keep the equation number out of the SVG (lwarp bakes
+% it into a full-width minipage image) and emit it as HTML text instead.
+\AtBeginEnvironment{lateximage}{\let\tagform@\@gobble}
+\AfterEndEnvironment{lateximage}{%
+  \ifboolexpr{bool{LWR@indisplaymathimage} and test{\ifnumequal{\value{LWR@lateximagedepth}}{0}}
+      and not test{\ifnumless{\value{equation}}{\value{LWR@startingequation}}}}{%
+    \InlineClass{eqnum}{(\ifnumequal{\value{equation}}{\value{LWR@startingequation}}%
+      {\theequation}{\thechapter.\arabic{LWR@startingequation}--\theequation})}}{}}
+
+% Head appendices "Appendix" instead of "Chapter".
+\renewcommand*{\LWR@printchaptername}{\@chapapp~}
+
+% Unwrap table scaling/framing macros so tabular & tokens are read in place,
+% emit <span class="figurecaption"> inside <figcaption> so Pandoc keeps
+% <figcaption>, and preserve \cellcolor via data-bg.
+\renewcommand{\tcresizewidth}{}
+\renewcommand{\ebresizewidth}{}
+\renewcommand{\ebresizewidthsw}{}
+\renewcommand{\ebresizeverb}[1]{}
+\RenewDocumentCommand{\LWR@HTML@framebox}{d() o o}{}
+\renewenvironment*{LWR@figcaption}%
+  {\LWR@stoppars\LWR@htmltagc{figcaption}\LWR@startpars\hbadness=10000\relax}%
+  {\LWR@stoppars\LWR@htmltagc{/figcaption}\LWR@startpars}
+\renewcommand*{\LWR@subaddtabularcellcolor}[1]{%
+  \LWR@htmltag{span class=\textquotedbl{}cellcolor\textquotedbl\ data-bg=\textquotedbl\LWR@origpound#1\textquotedbl}\LWR@htmltag{/span}}
+
+% Support \multirow nested inside \multicolumn and empty multirow-spanned cells.
+\NewCommandCopy\LWR@orig@htmlmulticolumn\LWR@htmlmulticolumn
+\def\LWR@mc@row#1#2#3\multirow\@nil{\LWR@HTML@multicolumnrow{\LWR@mc@n}{\LWR@mc@a}{#1}{#2}{#3}}
+\def\LWR@chkmrow#1\multirow#2\@nil{%
+  \ifblank{#2}{\LWR@orig@htmlmulticolumn{\LWR@mc@n}{\LWR@mc@a}{#1}}{\LWR@mc@row#2\@nil}}
+\RenewDocumentCommand{\LWR@htmlmulticolumn}{m m +m}{%
+  \def\LWR@mc@n{#1}\def\LWR@mc@a{#2}\LWR@chkmrow#3\multirow\@nil}
+\StartDefiningTabulars
+\patchcmd{\LWR@tabledatacolumntag}{\ifdefequal{\LWR@mynexttoken}{\end}}{%
+  \ifboolexpr{bool{LWR@usedmultirow} and bool{LWR@doingcmidrule} and test {\ifdefequal{\LWR@mynexttoken}{&}}}%
+    {\global\let\LWR@mynextaction\mrowcell}{}%
+  \ifdefequal{\LWR@mynexttoken}{\end}}{}{}
+\StopDefiningTabulars
+
+% Wrap <pre> contents in <code> so Pandoc preserves code blocks without
+% parsing inner anchors, defer \lnlbl (<a id="ln:...">) tags to immediately
+% after </pre>, keep fvextra/verbbox line numbers on their own lines, wrap
+% verbbox in <pre>, hang boxed verbatim from top, and prevent \midrule from
+% eating "(1)".
+\def\pfb@lnlbls{}
+\expandafter\patchcmd\csname\string\LWR@atbeginverbatim\endcsname{\par}{\LWR@htmltag{code}\par}{}{}
+\expandafter\patchcmd\csname\string\LWR@atbeginverbatim\endcsname{\begingroup}{\begingroup
+  \renewcommand*{\LWR@label@createtag}[1]{%
+    \LWR@sanitize{##1}\xappto\pfb@lnlbls{\noexpand\LWR@htmltag{a id=\textquotedbl\LWR@sanitized\textquotedbl}\noexpand\LWR@htmltag{/a}}}}{}{}
+\patchcmd{\LWR@afterendverbatim}{\LWR@htmltag{/pre}}{\LWR@htmltag{/code}\LWR@htmltag{/pre}\pfb@lnlbls\gdef\pfb@lnlbls{}}{}{}
+\renewcommand*{\LWR@FV@linethensep}{\hbox to 1em{\hss\theFancyVerbLine}\kern\FV@NumberSep}
+\define@key{FV}{baseline}{}
+\let\FV@baseline\@ne
+\AtBeginDocument{%
+  \renewcommand{\LstLineNo}{\leavevmode\hbox to 1em{\hss\arabic{VerbboxLineNo}}\kern\FV@NumberSep}%
+  \patchcmd{\verbbox}{\let\my@par\par}{\let\my@par\endgraf}{}{}%
+  \patchcmd{\verbbox}{\verbatim\verbbox@inner}{\LWR@atbeginverbatim{verbatim}\verbatim\verbbox@inner}{}{}%
+  \patchcmd{\endverbbox}{\egroup}{\LWR@afterendverbatim\egroup}{}{}%
+  \pretocmd{\theverbbox}{\LWR@forcenewpage}{}{}%
+  \DeclareDocumentCommand{\LWR@HTML@midrule}{o}{%
+    \IfValueTF{#1}{\LWR@docmidrule[#1](){1-\arabic{LWR@tabletotalLaTeXcols}}}%
+                  {\defaddtocounter{LWR@hlines}{1}}%
+    \LWR@getmynexttoken}}
+
+% Alias inline enumerate* to block enumerate, and no-op \phantomsection.
+\RenewDocumentEnvironment{enumerate*}{o}{%
+  \IfNoValueTF{#1}{\begin{enumerate}}{\begin{enumerate}[#1]}}{\end{enumerate}}
+\renewcommand{\phantomsection}{}
+\renewcommand{\LWR@phantomsection}{}
+
+% Page-dropping variants of perfbook's cross-reference, quiz, and credit macros,
+% direct footnote & Quick Quiz answer anchor linkage, plus ASCII normalization
+% of \" in label keys and removal of " on \cpageref{}".
+\renewcommand{\pararef}[1]{paragraph ``\nameref{#1}''}
+\renewcommand{\Pararef}[1]{Paragraph ``\nameref{#1}''}
+\renewcommand{\QuickQHeadingPage}[3]{\hyperref[#2.#3]{\textbf{Quick Quiz #3:}}}
+\patchcmd{\QuickQuizAnswer}{\rule{7pt}{7pt}}{\textbf{[Answer]}}{}{}
+\patchcmd{\QuickA}{\rule{7pt}{7pt}}{\textbf{[Question]}}{}{}
+\patchcmd{\QuickA}{\noindent}{\noindent\label{QQA.\QuickQuizAnswerChapter.\thequickquizctrC}}{}{}
+\patchcmd{\QuickE}{\ding{113}}{\HTMLunicode{2751}}{}{}
+\def\pfb@fnid{footnote-\arabic{LWR@htmlfilenumber}-\@thefnmark}
+\def\@makefnmark{\LWR@htmltag{a id=\textquotedbl{}fnref-\pfb@fnid\textquotedbl\ href=\textquotedbl\LWR@origpound\pfb@fnid\textquotedbl}\textsuperscript{\@thefnmark}\LWR@htmltag{/a}}
+\long\def\@makefntext#1{\LWR@htmltag{a id=\textquotedbl\pfb@fnid\textquotedbl\ href=\textquotedbl\LWR@origpound{}fnref-\pfb@fnid\textquotedbl}\@thefnmark.\LWR@htmltag{/a}~{#1}}
+\renewcommand{\OrigPubItem}[4]{\item \Cref{#1} (``#2'') originally appeared in #3~\cite{#4}.}
+\renewcommand{\RangeOrigPub}[5]{\item \Cref{#1}--\ref{#2} (``#3'') originally appeared in #4~\cite{#5}.}
+\renewcommand{\ContribItem}[2]{\item \Cref{#1} by #2.}
+
+\def\LWR@clean@arg#1{{\def\"##1{##1}\xdef\LWR@on@arg{#1}}}
+\let\LWR@orig@cref\cref
+\let\LWR@orig@Cref\Cref
+\renewcommand{\cref}[1]{\LWR@clean@arg{#1}\LWR@orig@cref{\LWR@on@arg}\futurelet\LWR@tok\LWR@on@a}
+\renewcommand{\Cref}[1]{\LWR@clean@arg{#1}\LWR@orig@Cref{\LWR@on@arg}\futurelet\LWR@tok\LWR@on@a}
+\def\LWR@on@a{\ifx\LWR@tok\@sptoken\expandafter\LWR@on@b\fi}
+\expandafter\def\expandafter\LWR@on@b\space{\futurelet\LWR@tok\LWR@on@c}
+\def\LWR@on@c{\ifx\LWR@tok o\expandafter\LWR@on@d\else\space\fi}
+\def\LWR@on@d o#1{\ifx n#1\expandafter\LWR@on@e\else\space o#1\fi}
+\def\LWR@on@e{\futurelet\LWR@tok\LWR@on@f}
+\def\LWR@on@f{\ifx\LWR@tok\@sptoken\expandafter\LWR@on@g\else\space on\fi}
+\expandafter\def\expandafter\LWR@on@g\space{\futurelet\LWR@tok\LWR@on@h}
+\def\LWR@on@h{\ifx\LWR@tok\cpageref\expandafter\LWR@on@i\else\space on \fi}
+\def\LWR@on@i\cpageref#1{\edef\LWR@tmp{#1}\ifx\LWR@tmp\LWR@on@arg\else\space on \cpageref{#1}\fi}
+\renewcommand{\cpageref}[1]{\cref{#1}}
+
+\crefname{quickquizctr}{Quick Quiz}{Quick Quizzes}
+\crefname{quickquizctrC}{Quick Quiz}{Quick Quizzes}
+\crefname{quickquizctrP}{Quick Quiz}{Quick Quizzes}
+\crefname{paragraph}{paragraph}{paragraphs}
+\Crefname{paragraph}{Paragraph}{Paragraphs}
+\appto\appendix{%
+  \crefalias{chapter}{appendix}%
+  \crefalias{section}{subappendix}%
+  \crefalias{subsection}{subsubappendix}%
+  \crefalias{subsubsection}{subsubsubappendix}}
+\makeatother
+
+\graphicspath{{epub-figs/}{./}}
-- 
2.55.0

