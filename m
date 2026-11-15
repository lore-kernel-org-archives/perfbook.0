Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776507;
	b=5Uzcf6qr+dVfhRb62NNVeLLqbBM/UlHmwvkmdkOYul8ixpmhX0iUgtKvTxodhTP6+DEA
	 iU1csPRosh63eLGX9gpJBslBTyx4w9rdIXkUS+5dWPxGuJtWkvazxFfduKk2rcMIcpicX
	 eXn5+bAk51zzAiaP/Xb46JuBp/7bv7zq+7A8S4PuM0VF3wY/vlEEROnsHcxlqGqZm7I/u
	 7SVE/Oi9GX0OfPYZjzdiGdOKV4knriXzPkaXnmMBCOY/VmBzMzBhTdmDBSRvAYe1GHqm7
	 PJKW7DeTqrMD0Y2MNYkuEjgOV8RoTKXmifDKfF26UvJ4iThZpV0erdSJj1wZpCuqAfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776507;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+Bpq7ruFaoNfv4AnRhQ8/LsiWH9jj7TpbWfaiwgceDU=;
	b=mryNSvgqC9GTzb2xFwOMY305X78pWC8nyjt8S77zYPoSlKdTXaeMpXcOZOSLnaqt1cP7
	 yQoo7tpd2cMygIhXxsxb2+0R62HJyBzftvjtjztROgWQb3yJff914l2jhzTKdTwtWBdzs
	 K9zERHxROs5+YunH3lVf9VA1bIb94YUexatqfWlTGmKXwe1rv+0JEsyt2fwdt0V3dOi+P
	 EF8FRyCeEQ29+VUjPS/8LUIZl50YYvzf+Fvpiyhb0WYj+5T+qjs0hJ7Fz+5HSmWgS8ld0
	 jrR1lZYMblRlaIeezd6bTSNdDo1J7nXd5N0GFfPgHHsEtCsTQI1FnA+E8tR+A4KmS8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=fejes.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCC2606A329
	for <perfbook@vger.kernel.org>; Sun, 15 Nov 2026 21:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BCC2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fejes.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-37986eb6fa2so3156598eec.0
        for <perfbook@vger.kernel.org>; Sun, 15 Nov 2026 13:01:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776506; x=1795381306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Bpq7ruFaoNfv4AnRhQ8/LsiWH9jj7TpbWfaiwgceDU=;
        b=IMnQb4uqZzVoJ5WjZP11i9SQDIatgO6IdDNqYsbPgawnWmhoqtlNsNc7oTreObw8J6
         WRthVCbQ4n1akfCTa3lEWU9/horuziXiwuTLuc0ZRuqS2L9qTdW3L6L7pWPDDGwH4kk8
         RLhhkDDLRJn2SMhPqxnrksGdG6oq7lNE9yhEEqBRKSitriBYoMJexX88lG9OH0qyvJcv
         d9Dd5O5q1PiPukbQJ+gcknXqu3/4VrW00En+BehfAEGL5EcwSUGorTvrwzsBwWATQm2n
         V0ApHCGEbMOzwAhG2z5+bTlGuTcDtpBS7K40EQmF9WXH5S1pMLAz3lJ8e4+p/Xt7dxoc
         QubA==
X-Gm-Message-State: APuU4Z8PU8aAAv6ShFlSa6obVDgDPUrhelkC6wAuF+fkesxOGQJsuJSb
	yIRA8mr91qiSQr5JuqX1w1UtJ511H7BjL9gM6qxcWWZ1jRSRDSiayEUrUKWyJM7rJ3QfZVRc
X-Gm-Gg: AYBFou2F/G4G+RXQDDhVhO2B0ssqEj79dqIqZHK3wVBic7gXC3B2oxi7HTGthz8Lx/b
	inWpcGA4oXKNaSkjXj8ZqXwHI4x3ZF0QXQ2g6eIj84ciw1JMtAYJApYNRRYaC96rN3qbvUD6RRF
	HLcB15BuQ2UGL0lrRd4kPgIRv0chk1jdyFj/EPS7vGcN93Op0jsy9S6+fMorIHXwc0cHBjTNX00
	jnCFLGJZvwx03OMqzJ6emFBZR7rvqapwWxM+8wfxyUwUB/7DiTeMiRrxBHvD3IZ87rjJ3bi3gal
	pB4lSxAUCd99c1C045+0QjRlGHKigAYXxRpuoViFJaDBGYxIbqaplqgNAQbeinSlmhrcKhuHRNp
	lo0br8sL3IFBZuJ1dYshsuQEg9ULj8rGpYfMd0n9oKmTwskdD308RutkpZko9J9xYNDOW69ynVY
	IyKBp4NxPx+xfBugM6+lMdTdOiEQqINLONh+lkFyBz3gYEC9i1bTJurKsD55UjegjbtJ5OQEBao
	Vs1DMNOT8ZdOSxo9jyD/geyzqJnqKI8LK8XOxdEOoPot4LooTZnRX/s6WZU2JMLee3y7RK2OhbE
	b4IXyuhUdOCo7rHtqIuxpzTwj6aBiN9VnWI+MwACQpGshyiyxvxdiEdPwUZo+sCPDD4EJ0r3KQq
	4uXIHDjcTA9nyds04x0jYXVU9U36B620oMmbCgR5DvwZnpz+6nX1YxotU72Q+2v49XcfOBLWR0L
	ClAi4hkfc52N52WQ8JRWLDUWkMf+2/TcG8nUeHCbw=
X-Received: by 2002:a05:7300:86:b0:375:be89:8a47 with SMTP id 5a478bee46e88-3796740b880mr9500316eec.27.1794776506210;
        Sun, 15 Nov 2026 13:01:46 -0800 (PST)
Received: from hp.tailca3b3b.ts.net ([2001:67c:370:128:4595:f7da:56c1:448d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm26926677eec.22.2026.11.15.13.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:01:45 -0800 (PST)
From: Ferenc Fejes <ferenc@fejes.dev>
To: perfbook@vger.kernel.org
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Leonardo Bras <leobras.c@gmail.com>,
	Ferenc Fejes <ferenc@fejes.dev>
Subject: [RFC PATCH 5/7] epub: Add endnote variant for readers without popup footnotes
Date: Sun, 15 Nov 2026 22:01:36 +0100
Message-ID: <20261115210138.229034-6-ferenc@fejes.dev>
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

Add make epub-endnotes to transform perfbook.epub into
perfbook-endnotes.epub without re-running LaTeX or Pandoc.  It moves
chapter footnote asides into linked end-of-chapter sections and unwraps
Quick Quiz answer asides into regular blocks for e-readers without EPUB3
popup support.

Signed-off-by: Ferenc Fejes <ferenc@fejes.dev>
---
 Makefile                  |  9 +++++++--
 utilities/epub-fixhtml.pl | 15 ++++++++++++++-
 utilities/runlwarp.sh     | 19 ++++++++++++++++---
 3 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index cf1282d1..358fab3a 100644
--- a/Makefile
+++ b/Makefile
@@ -252,7 +252,7 @@ BASE_DEPENDS := perfbook.tex $(foreach v,tcb 1c msns mss mstx msr msn msnt sf nq
 .PHONY: qq perfbook-qq.pdf qqmsg
 .PHONY: help help-official help-full help-semiofficial help-paper help-draft
 .PHONY: help-experimental help-prefixed
-.PHONY: epub epub-clean html html-clean
+.PHONY: epub epub-endnotes epub-clean html html-clean
 .PHONY: paper-clean periodcheck punctcheck punctcheck-auto
 .PHONY: cleanfigs cleanfigs-eps cleanfigs-svg cleanfigs-epub figs precheck
 
@@ -656,6 +656,8 @@ help-experimental:
 	@echo
 	@echo "Reflowable EPUB (experimental, lwarp + pandoc; see FAQ-BUILD.txt #15):"
 	@echo "  perfbook.epub,     epub: chapter-split EPUB3 from the ebook-size variant"
+	@echo "  perfbook-endnotes.epub, epub-endnotes: same, with plain linked endnotes and"
+	@echo "                    inline Quick Quiz answers instead of popup footnotes"
 	@echo "  perfbook-epub_html.html, html: lwarp HTML only, no EPUB packaging"
 
 PDFTOCAIRO := $(shell $(WHICH) pdftocairo 2>/dev/null)
@@ -684,6 +686,7 @@ $(EPUB_SVG_CROP): CodeSamples/formal/data/RCU-test-ratio.svg
 	@cp $< $@
 
 epub: perfbook.epub
+epub-endnotes: perfbook-endnotes.epub
 html: perfbook-epub_html.html
 
 perfbook-epub.tex: perfbook-eb.tex
@@ -696,6 +699,8 @@ perfbook.epub:
 	LATEX=$(LATEX) sh utilities/runlwarp.sh perfbook-epub
 perfbook-epub_html.html:
 	LATEX=$(LATEX) sh utilities/runlwarp.sh perfbook-epub html
+perfbook-endnotes.epub: perfbook.epub utilities/runlwarp.sh utilities/epub-fixhtml.pl
+	LATEX=$(LATEX) sh utilities/runlwarp.sh perfbook-epub endnotes
 
 cleanfigs-epub:
 	rm -rf epub-figs
@@ -743,7 +748,7 @@ ls-unused:
 
 neatfreak: distclean
 	find . -name '*.pdf' | xargs rm -f
-	rm -f perfbook.epub
+	rm -f perfbook.epub perfbook-endnotes.epub
 
 cleanfigs-eps:
 	rm -f $(EPSSOURCES_FROM_TEX) $(EPSSOURCES_FROM_DOT) $(EPSSOURCES_FROM_FIG)
diff --git a/utilities/epub-fixhtml.pl b/utilities/epub-fixhtml.pl
index 64428efc..4940681a 100755
--- a/utilities/epub-fixhtml.pl
+++ b/utilities/epub-fixhtml.pl
@@ -10,11 +10,24 @@
 use strict;
 use warnings;
 
-my $pkg = shift(@ARGV) or die "Usage: $0 <epub-pkg-dir>\n";
+my $endnotes = (@ARGV && $ARGV[0] eq '--endnotes') ? shift(@ARGV) : 0;
+my $pkg = shift(@ARGV) or die "Usage: $0 [--endnotes] <epub-pkg-dir>\n";
 
 sub slurp { open my $fh, '<:raw', $_[0] or die "$_[0]: $!"; local $/; <$fh> }
 sub spurt { open my $fh, '>:raw', $_[0] or die "$_[0]: $!"; print $fh $_[1] }
 
+if ($endnotes) {
+    for my $f (glob("$pkg/EPUB/text/*.xhtml")) {
+        my ($x, @fn) = slurp($f);
+        $x =~ s{<aside id="(footnote-[^"]+)"[^>]*>(.*?)</aside>\n?}{push @fn, qq(<div class="endnote" id="$1">$2</div>); ''}gse;
+        $x =~ s{</body>}{<section class="endnotes">\n<hr />\n@{[join "\n", @fn]}\n</section>\n</body>} if @fn;
+        $x =~ s{<aside class="quiz-answer" id="([^"]+)"[^>]*>(.*?)</aside>}{<div class="quiz-answer" id="$1">$2</div>}gs;
+        $x =~ s/\s+(?:epub:type|role)="(?:doc-)?(?:noteref|footnote|backlink)"//g;
+        spurt($f, $x);
+    }
+    exit 0;
+}
+
 my (%w, %h, %rot90, %fig);
 for my $f (glob("$pkg/EPUB/media/*.svg")) {
     my ($n) = $f =~ m{([^/]+)$};
diff --git a/utilities/runlwarp.sh b/utilities/runlwarp.sh
index 7e0dbd65..d55d87f7 100644
--- a/utilities/runlwarp.sh
+++ b/utilities/runlwarp.sh
@@ -2,7 +2,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 #
 # Build a reflowable EPUB (or browsable HTML) from perfbook-epub.tex.
-# Usage: sh utilities/runlwarp.sh perfbook-epub [epub|html]
+# Usage: sh utilities/runlwarp.sh perfbook-epub [epub|endnotes|html]
 #
 # Copyright (C) Ferenc Fejes, 2026
 #
@@ -18,7 +18,7 @@ BOOK_COVER="cartoons/r-2014-Book-cover-front.png"
 MIN_LWARP_VERSION="0.921"
 
 if [ -z "$1" ]; then
-	echo "Usage: sh utilities/runlwarp.sh <file[.tex]> [epub|html]" >&2
+	echo "Usage: sh utilities/runlwarp.sh <file[.tex]> [epub|endnotes|html]" >&2
 	exit 2
 fi
 
@@ -264,6 +264,16 @@ build_epub () {
 	echo "perfbook.epub built ($html_passes HTML passes)."
 }
 
+build_endnotes () {
+	package="$tmp/endnotes"
+	rm -rf "$package" && mkdir -p "$package"
+	unzip -q perfbook.epub -d "$package" || exit 2
+	perl utilities/epub-fixhtml.pl --endnotes "$package" || exit 2
+	repack_epub "$package" perfbook-endnotes.epub
+	rm -rf "$package"
+	echo "perfbook-endnotes.epub built."
+}
+
 # ---------------------------------------------------------------------------
 # Main dispatch
 # ---------------------------------------------------------------------------
@@ -280,7 +290,10 @@ html)
 	wait_limages
 	echo "HTML ready: $html.html (split chapters ${base}-*.html, images ${base}-images/)."
 	;;
+endnotes)
+	build_endnotes
+	;;
 *)
-	die "Unknown mode '$mode' (want epub|html)"
+	die "Unknown mode '$mode' (want epub|endnotes|html)"
 	;;
 esac
-- 
2.55.0

