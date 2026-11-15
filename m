Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776506;
	b=TMhzYRXeCMRlMiAk541mg2DvmUisplRL9fwngn0yh5p88hK0S/IAoUzPDw9oRcg8UUKl
	 g89uUhRV6VtqBJX70sbxmzSv1tyGlNjZ+8fqUqOTVsv0uNo2Cij+rOpekvEKNPErgS2pX
	 s8+ReUm/lMldU9VzIbLSB4Xz71rIhNwT+7zlteszkxS2O5rSQRTjCg5WNBsrjilos1o54
	 /JZW2Ld0B4t+FP2vZn/Mp5p8pDrGOEC3R2PpqB4exFlmH7Nbl8D0xshTBbFbLhUF1GVXH
	 ePdAjhBWCXobVcPLXpIHppe/cW8eolEEwJNFPFEdd+kX6iI+lBWUJ2aHPwfpMsn3WlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776506;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=fIoQhGdbvaI+hAsU+8K5yLwrGKNoBtWHS0fjLfhM2xE=;
	b=pgcbV36ZpMB/9WCeKQPWMm5WQSS81vDETRjOo1tymCUT9KnZehfbdfUCpM/qd9odyMun
	 czmyk99/KB3vBQciWgw1uh8nsPlvgO0bA82RmwLsW2JdbPl9LLfGHxXlIixjNs90h3Ivb
	 sJWkhXwzVm0243PGEe/lKStcFBIA/pHbnLtJaPUI4ACvZAonDcx9QjPR5IAWZ/bsnCWFn
	 MdOxNbmyRyzJkJVyyq3+YRUxf6vStTQBGbWOYzTiPXIpnlDsb/V0Ga/oEwUP6MSNeBWn4
	 FFczem4Lp2DyT3dwbhVZB7XxoOhvgfopunE6kgFemrOhY+J/8iDgpgDrFnVD602kqlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=fejes.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A389B606A31F
	for <perfbook@vger.kernel.org>; Sun, 15 Nov 2026 21:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A389B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fejes.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37986eb6fa2so3156570eec.0
        for <perfbook@vger.kernel.org>; Sun, 15 Nov 2026 13:01:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776505; x=1795381305;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fIoQhGdbvaI+hAsU+8K5yLwrGKNoBtWHS0fjLfhM2xE=;
        b=pJCvzjb7horjAawXzi7LLtqpPH31XglPb893rehxA9XoJXfvij+PzuSDovGozdkLMj
         jHfPomIW+8072AStU+vGEWM+eYIVnVbiTSOn4AaN4CDEMkOmUa7nlOEkVPVUfBrnh5X5
         l43MZboxAIQbvDzxUpygPk5GiggJHQyZP4nUSgzXXvhF3FEpcFATFS+Qh2QSi1Oa1eDO
         I8cNljzDJlUyTgevwsvcpzFOKc1CG+gZ/KwNeHxldPIqxHoWDBzwlQu029Vop4vXgYiH
         ob2Z2ZyoEQuWpzVNACpDmv6auQyvzBu24hL4ZBhRmBnOU6VPLyIcXsOCYWcR/XyaA8Xr
         ao+A==
X-Gm-Message-State: APuU4Z/16OlTfnvaPphDQwg8yA20+dK7o00pSwQubzUKFYX0NbsJ07h+
	aHr/FqFh9r/Oh7MZGLxUKUlzZbBANU7xQhr5r/KBNWqLhBJgXiU8Nh6zY1gyDgRtcFaiuEfd
X-Gm-Gg: AYBFou3bGxtPVdgqJPrzp/DNjmBXU9wi3q0qAj5+6zER5eYLyA66NziKpWCBNiqPN+o
	xFPUssMZvhQlBwSn4hy9r9NJgaU6EiUoVPO4Lio9R8jklpb//02q85i8XGlm2+lWV5ptY8lDvVL
	BmaY0ZmeM9UG1Cm0WmtPRcSEaxzPcH4Ir7MLQJ471RKKXbu6Kaiu5r46k8TZy9+tNCFAAVODd1a
	3SteIUH8H/n2W88Gj1IZUZC8EvYWRTun7WnVa15Dov2cJSu/m/eoF9Aq3/W3oD0lYUFF4zAZQIl
	S6J9JeWn8dnvTVfMtII4BTDx1ZR2oCGX3fJifQD/0XLpzzigfy44IKoJsKr1CannyZbqabb6PWw
	fznltGk874x9dDbhrkmQ5oSpe6y5Eup1utzEHz8jtlgOFSjLTBTY6NU2DGUC8n0WRSlNLkmTPBp
	kzTD+J1Jv2p/mCWyQRzapwXRTGDceg/kJOtPKb7Kyo3L6mvkVxM8m/Kl/vPRaXYOJhBdrUWlpLw
	nSD55hMSrEb7tyAy9AH8phl7ZWIGkVmgjZsA8WtiQTmtDc3MA3x7NAYzI1cDf1eiLjjsT34tkBR
	MNbDWtJJ6ht3tOh/aI4CtuxLvo41eAq5NFG/mwqxzMvmXYjf5QGo4TiRHjeCzbfrcxm31G6EokI
	3y6VMx3PNSMkDcCxFIGag+QxaaEhXFq7aSPexhaF1FGvUn+Gh+aazF56zjZAgirJ0itMLD3wAnS
	FEM5bYEhCZqBbcR8gjldodtvhtBkQuZ8/3KJtvDc0=
X-Received: by 2002:a05:7301:4604:b0:376:703c:8819 with SMTP id 5a478bee46e88-379681c6998mr9931394eec.38.1794776504404;
        Sun, 15 Nov 2026 13:01:44 -0800 (PST)
Received: from hp.tailca3b3b.ts.net ([2001:67c:370:128:4595:f7da:56c1:448d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm26926677eec.22.2026.11.15.13.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:01:43 -0800 (PST)
From: Ferenc Fejes <ferenc@fejes.dev>
To: perfbook@vger.kernel.org
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Leonardo Bras <leobras.c@gmail.com>,
	Ferenc Fejes <ferenc@fejes.dev>
Subject: [RFC PATCH 3/7] utilities/runlwarp.sh: Add lwarp and Pandoc build driver
Date: Sun, 15 Nov 2026 22:01:34 +0100
Message-ID: <20261115210138.229034-4-ferenc@fejes.dev>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add utilities/runlwarp.sh to drive multi-pass lwarp HTML compilation,
background SVG math rendering, and Pandoc EPUB3 packaging.  After
running epub-fixhtml.pl and appending epub.css, the script verifies
anchor, equation, footnote, Quick Quiz, and epigraph counts and runs
epubcheck when available.

Signed-off-by: Ferenc Fejes <ferenc@fejes.dev>
---
 utilities/runlwarp.sh | 286 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 286 insertions(+)
 create mode 100644 utilities/runlwarp.sh

diff --git a/utilities/runlwarp.sh b/utilities/runlwarp.sh
new file mode 100644
index 00000000..7e0dbd65
--- /dev/null
+++ b/utilities/runlwarp.sh
@@ -0,0 +1,286 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Build a reflowable EPUB (or browsable HTML) from perfbook-epub.tex.
+# Usage: sh utilities/runlwarp.sh perfbook-epub [epub|html]
+#
+# Copyright (C) Ferenc Fejes, 2026
+#
+# Authors: Ferenc Fejes <ferenc@fejes.dev>
+
+: "${LATEX:=pdflatex}"
+: "${MAXPASS:=6}"
+: "${PANDOC:=pandoc}"
+
+BOOK_TITLE="Is Parallel Programming Hard, And, If So, What Can You Do About It?"
+BOOK_AUTHOR="Paul E. McKenney"
+BOOK_COVER="cartoons/r-2014-Book-cover-front.png"
+MIN_LWARP_VERSION="0.921"
+
+if [ -z "$1" ]; then
+	echo "Usage: sh utilities/runlwarp.sh <file[.tex]> [epub|html]" >&2
+	exit 2
+fi
+
+base=${1%.tex}
+html=${base}_html
+tmp=epub-tmp
+mode=${2:-epub}
+
+# ---------------------------------------------------------------------------
+# Logging and assertion helpers
+# ---------------------------------------------------------------------------
+
+die () {   # $1 = message, $2 = optional exit code (default: 2)
+	echo "----- $1 -----" >&2
+	exit "${2:-2}"
+}
+
+check_count () {   # $1 = label, $2 = expected, $3 = actual
+	if [ "$2" -ne "$3" ]; then
+		die "$1: expected $2, found $3" 1
+	fi
+}
+
+check_positive () {   # $1 = label, $2 = expected, $3 = actual
+	check_count "$1" "$2" "$3"
+	if [ "$2" -le 0 ]; then
+		die "$1: count is zero" 1
+	fi
+}
+
+count_matches () {   # $1 = grep regex, $2... = files
+	pattern=$1
+	shift
+	grep -rho "$pattern" "$@" 2>/dev/null | wc -l
+}
+
+# ---------------------------------------------------------------------------
+# Prerequisite checks
+# ---------------------------------------------------------------------------
+
+check_prerequisites () {
+	tools="$LATEX bibtex lwarpmk pdftocairo unzip zip"
+	if [ "$mode" = epub ]; then
+		tools="$tools $PANDOC"
+	fi
+	for tool in $tools; do
+		command -v "$tool" >/dev/null 2>&1 ||
+			die "Required tool not found: $tool (prerequisites: #15 in FAQ-BUILD.txt)"
+	done
+
+	lwarp_ver=$(lwarpmk --version 2>/dev/null | sed -n 's/.*v\([0-9][0-9.]*\).*/\1/p')
+	if [ -z "$lwarp_ver" ] || ! awk -v v="$lwarp_ver" -v min="$MIN_LWARP_VERSION" 'BEGIN { exit !(v >= min) }'; then
+		die "lwarp >= $MIN_LWARP_VERSION is required (found ${lwarp_ver:-unknown})"
+	fi
+}
+
+# ---------------------------------------------------------------------------
+# LaTeX, BibTeX, glossary, and lwarp HTML compilation
+# ---------------------------------------------------------------------------
+
+# Run $LATEX with $3 flags on job $1; abort on fatal TeX errors in $1.log.
+run_latex () {   # $1 = jobname, $2 = step description, $3 = extra flags
+	job=$1
+	label=$2
+	flags=$3
+
+	echo "$LATEX $flags for $job # $label"
+	$LATEX $flags -interaction=nonstopmode "$job" >/dev/null 2>&1 </dev/null ||
+		die "!!! LaTeX failed for $job !!!"
+	[ -r "$job.log" ] ||
+		die "no log produced for $job"
+
+	if grep -q '^! ' "$job.log"; then
+		echo "----- !!! TeX error in $job.log !!! -----" >&2
+		grep -A 6 '^! ' "$job.log" | head -n 60 >&2
+		exit 2
+	fi
+}
+
+# Run BibTeX and normalize single-page endashes and double-braced \href in .bbl.
+build_bbl () {
+	if grep -q '\\bibdata' "$html.aux"; then
+		bibtex "$html" >/dev/null &&
+		sed -i \
+			-e 's/\bpage \([0-9]*\)–/pages \1--/g' \
+			-e 's/\\href {{\([^}]*\)}}/\\href {\1}/g' \
+			"$html.bbl"
+	fi
+}
+
+# Build acronyms/glossary via makeglossaries, falling back to makeindex.
+build_glossary () {
+	if [ -r "$html.acn" ]; then
+		makeglossaries "$html" >/dev/null 2>&1 || {
+			[ -r "$html.ist" ] &&
+			makeindex -s "$html.ist" -t "$html.alg" -o "$html.acr" "$html.acn" >/dev/null 2>&1
+		}
+	fi
+}
+
+# Return 0 when all LaTeX references and lwarp's math-image list have stabilized.
+is_html_stable () {
+	! grep -q 'Rerun to get\|Label(s) may have changed\|There were undefined' "$html.log" &&
+	tail -n 1 "$base-images.txt" 2>/dev/null | grep -q '|end|end|end|'
+}
+
+# Wait for backgrounded pdfcrop/pdftocairo jobs spawned by `lwarpmk limages`.
+wait_limages () {
+	while find "$base-images" -name '*.pdf' -o -size 0 2>/dev/null | grep -q .; do
+		sleep 0.1
+	done
+}
+
+build_html () {
+	if [ ! -r "$html.html" ]; then
+		rm -f "$html.aux" "$html.bbl" "$html.toc" "$html.lof" "$html.lot" "$html.out"
+	fi
+
+	# 1. Print pass: lwarp generates ${html}.tex and lwarpmk.conf.
+	run_latex "$base" "lwarp wrapper generation" -draftmode
+	[ -r "$html.tex" ] || die "lwarp did not write $html.tex"
+
+	# 2. HTML passes: iterate until cross-references and image list converge.
+	html_passes=0
+	draft=-draftmode
+	[ -r "$html.bbl" ] && draft=
+
+	while :; do
+		html_passes=$((html_passes + 1))
+		[ "$html_passes" -ge 3 ] && draft=
+		run_latex "$html" "HTML pass $html_passes" "$draft"
+
+		if [ "$html_passes" -eq 1 ]; then
+			build_bbl &
+			bib_pid=$!
+			build_glossary &
+			gls_pid=$!
+			wait "$bib_pid" || die "bibtex failed for $html"
+			wait "$gls_pid" || die "glossary generation failed for $html"
+		fi
+
+		if is_html_stable; then
+			break
+		fi
+		if [ "$html_passes" -ge "$MAXPASS" ]; then
+			die "Still unstable after $MAXPASS passes, giving up." 1
+		fi
+	done
+
+	if grep -q 'LaTeX Warning: Reference\|LaTeX Warning: Citation' "$html.log"; then
+		grep -A 2 'LaTeX Warning: Reference\|LaTeX Warning: Citation' "$html.log" | head -n 40 >&2
+		die "Undefined references/citations remain in $html.log" 1
+	fi
+
+	# 3. Render math SVGs (backgrounded by lwarpmk) while splitting HTML chapters.
+	find "$base-images" -name '*.pdf' -o -size 0 -delete 2>/dev/null
+	lwarpmk limages   -p "$base" >"$tmp-limages.log"   2>&1 || { tail -n 20 "$tmp-limages.log"   >&2; exit 2; }
+	lwarpmk pdftohtml -p "$base" >"$tmp-pdftohtml.log" 2>&1 || { tail -n 20 "$tmp-pdftohtml.log" >&2; exit 2; }
+}
+
+# ---------------------------------------------------------------------------
+# EPUB packaging and validation
+# ---------------------------------------------------------------------------
+
+# Zip an unpacked EPUB directory ($1) into $2 with an uncompressed mimetype
+# entry first, as required by the EPUB OCF specification.
+repack_epub () {   # $1 = package dir, $2 = output epub
+	pkg_dir=$1
+	out_epub=$2
+	root=$(pwd)
+	tmp_epub="$out_epub.tmp"
+
+	rm -f "$tmp_epub"
+	(
+		cd "$pkg_dir" || exit 2
+		zip -X0 "$root/$tmp_epub" mimetype >/dev/null &&
+		zip -Xr9D "$root/$tmp_epub" META-INF EPUB >/dev/null
+	) || exit 2
+	mv -f "$tmp_epub" "$out_epub" || exit 2
+
+	if command -v epubcheck >/dev/null 2>&1; then
+		epubcheck "$out_epub" || die "epubcheck failed for $out_epub" 1
+	fi
+}
+
+# Verify that structural counts in packaged XHTML ($2...) match lwarp HTML ($html_chapters).
+validate_epub () {   # $1 = package dir
+	set -- "$1"/EPUB/text/*.xhtml
+
+	check_count "line-anchor preservation" \
+		"$(count_matches 'id="ln:' $html_chapters)" \
+		"$(count_matches 'id="ln:' "$@")"
+
+	check_positive "display equation formatting" \
+		"$(count_matches 'class="displaymathnumbered"' $html_chapters)" \
+		"$(count_matches '<table class="displaymath">' "$@")"
+
+	check_positive "footnote preservation" \
+		"$(count_matches 'id="fnref-' $html_chapters)" \
+		"$(count_matches '<aside[^>]*id="footnote-' "$@")"
+
+	check_positive "quiz answers on asides" \
+		"$(count_matches 'id="QQA\.' $html_chapters)" \
+		"$(count_matches '<aside[^>]*id="QQA\.' "$@")"
+
+	check_positive "epigraph preservation" \
+		"$(count_matches '<figure class="epigraph"' $html_chapters)" \
+		"$(count_matches '<figure class="epigraph"' "$@")"
+
+	check_count "unresolved references in HTML" 0 \
+		"$(count_matches 'href="#??"' $html_chapters)"
+
+	check_count "page-number phrases" 0 \
+		"$(count_matches 'page\(&nbsp;\| \)for' $html_chapters)"
+}
+
+build_epub () {
+	# Space-separated list of split chapter HTML files in reading order.
+	html_chapters=$(grep -o '<!--|Start file|[^|]*|' "$html.html" | cut -d'|' -f3 | awk '!seen[$0]++')
+	wait_limages
+
+	$PANDOC -f html-native_divs --shift-heading-level-by=-2 \
+		--split-level=1 --toc --toc-depth=3 \
+		--metadata title="$BOOK_TITLE" \
+		--metadata author="$BOOK_AUTHOR" \
+		--metadata lang=en-US \
+		--epub-cover-image="$BOOK_COVER" \
+		--resource-path=epub-figs:. \
+		-o "$base.epub" $html_chapters || exit 2
+
+	package="$tmp/package"
+	rm -rf "$package" && mkdir -p "$package"
+	unzip -q "$base.epub" -d "$package" || exit 2
+	perl utilities/epub-fixhtml.pl "$package" || exit 2
+
+	epub_css="$package/EPUB/styles/stylesheet1.css"
+	[ -r "$epub_css" ] || die "missing packaged stylesheet" 1
+	{ echo; cat utilities/epub.css; } >>"$epub_css" || exit 2
+
+	validate_epub "$package"
+	repack_epub "$package" perfbook.epub
+	rm -f "$base.epub"
+	echo "perfbook.epub built ($html_passes HTML passes)."
+}
+
+# ---------------------------------------------------------------------------
+# Main dispatch
+# ---------------------------------------------------------------------------
+
+case "$mode" in
+epub)
+	check_prerequisites
+	build_html
+	build_epub
+	;;
+html)
+	check_prerequisites
+	build_html
+	wait_limages
+	echo "HTML ready: $html.html (split chapters ${base}-*.html, images ${base}-images/)."
+	;;
+*)
+	die "Unknown mode '$mode' (want epub|html)"
+	;;
+esac
-- 
2.55.0

