Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776504;
	b=Po5mYvzCOduBGYTS85U6j2+9AnvD5eOIQkykIQfYC2XRUEURa3lpR5v3vjX+nIOA2faK
	 H/2muANyJNp0r2f6XH+lPAJHVBnbe1ld59vVAGQaMZnt8+Dj0B9zewmnbcnYlaUzXj96E
	 6y2fOlHKf/vPrIof1nfs+F5p/MWtzx25KALShWJQ1z1hM7I6bFQQJVvvb4QnnPuC/mNd/
	 g/kHZGw2M3ZLZ08nFB+pnre4m9xT5OwtYa1tOLEuze7Ap1AFDiLdJmpxptK+j6r3u+CxS
	 cilEDBJZvfhgzuKrD7VTqIgoR797nEamjllMLpvhrBbBu8oRmXSrRQ8lRd6UrgRiEmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776504;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wStZtJk68ZT8dbAg+SotQcq22tYPn8klAohRRJNCFHg=;
	b=QwTKVgr5F8j4LbJzhfYR/LYXpybC2mCwXMYVewRBLWvuxuovOfquFIDXm0jBiXQAbU1T
	 eQDGqIst6/H3zXrQRmLnqMiyEIsvtaxmkHCSGC+OQJWVBX5gqWO+ZTsQ+bBQF51uY864j
	 areBfIeW/P+52RNbuABKWEz6MJ8f3EeM6JQ52j8Dkitjav8kLL7GJOPV/8z5IRthzRD2t
	 xFFNumIlfBcNJ83e6+X9xAXcWgxcUBbO7iIo7WfI0z+eilQOEtIfyqKNQy9zd1Xcr21E4
	 6f/MRorepTPkoLhpBW9sZmFejkHcdfEx9C9V3AgNHDUHHjGJ6WxbBgBgVqec1nEIvBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=fejes.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FDE606A31F
	for <perfbook@vger.kernel.org>; Sun, 15 Nov 2026 21:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71FDE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fejes.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37986eb6fa2so3156558eec.0
        for <perfbook@vger.kernel.org>; Sun, 15 Nov 2026 13:01:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776504; x=1795381304;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wStZtJk68ZT8dbAg+SotQcq22tYPn8klAohRRJNCFHg=;
        b=HNlhWUxgMM6DgzAwdW8UX2gUED6yRy7Q6psOOKZ0DSwYx2dOWZvXpP1sfC1QnM4AOA
         vI6dAunIF8FAFfR8nHi/0FvAkeBpGp0AJyYV7sqeRJgSQzsSQ9GFj/ey7+2mL6O7ylr9
         gNlV1DQu+rDRAiqfN5NEATouudI93KUV2UWgFgiU76fC6SRzwUScx6kDv/UauxT++FZk
         EJbXp+2mMwutk8a6ZHizbduJs3ie7keiflAP/SrOXFfeRYnTrzElYT7JzRRYY4drKE/M
         SiX9XRirGCCsa+qB/WYmPjsUIK3WRDLPXxEEbC4AXJHYvhWCzg4H33tsTfo3yjDVfLnH
         ycaA==
X-Gm-Message-State: APuU4Z/xNb2VG9kpR9KHT4gy4bY7K+2fRJCsG9FQEpRM1rNM640dsKTW
	U7DOYdRkEJz6QyYRkQVnTcQs/Nz2viu1uXI8pCr8TCdbbBULt+eGfnnu6FysiJHsDqOptcPJ
X-Gm-Gg: AYBFou3BD0x45hfvzYZ1boeTm8pNJL1S4PaY1EGBEYyRHnaJW0oQRp26cSpOrnpWPYG
	8OybrK5DOcTdI2v5DY8biqrePqqwKbggf+2mfAYPJflHLtcoaq81elfAlYAqHTeZUPK6kkd/QtO
	LhDhlpLYqc1E5a6hLwq0pU34QrnhZCcq5ZIQmDXifETTLPtkDkBXFj30zUevkS7ksDC/FlH9xBn
	o+9ezUKaRylCpGVKNz4HckJtBJwJlTnH4yXRfojcRbl0rElrDkLk1tjgHZHAVHlhoiT7AWOK5sW
	8PlrRkxdkhHKBnDAek79w5zbhkiBIweCVRfegaCEx1N7HaR4FMWVYWd8mH8yYHYeD/DDlamfXWi
	5E3sdxmbWMNv0qvnG+L0UAaITnLv1yUVsYj37YxT/8wQAHM1uS7qhZAbRixDYtAiwKrsHQntJ8p
	yLxG/kwk4uY7jR1QNa8HHxRKx8xMY/u8wD7vHHh7PAvUd+U77IiqLS9u4hA54hujutw+OVlQ3gJ
	AHS+xZ19BcAI3IgM5B3yLf3iWNVZB65oKn+jBZRAVmW1BnVTHbFfPBXfum85GefJlf0dpcLEZOI
	Gg7NGeQrNa3j94seWFSIn0R4/HhmZBIfNAFZElTluSDwWrdIZ0/D/LL0bqON9EyKgU0ZowjC+Ch
	C/oQkQeGMKdkCPXsu53P5+zmK3jmEpZZBx7+ASqReq8ZzrX3TIKS0pyc6BzGinvaWQ3thCnmOaP
	mbaK/O7++TaAi8C5krz6GOCzfFIidmojE+7+lcoIKfvhrTqf9KrvMJSukzHCBb
X-Received: by 2002:a05:7300:50f1:b0:36a:22c8:ac57 with SMTP id 5a478bee46e88-37967be0dbfmr9641017eec.33.1794776503502;
        Sun, 15 Nov 2026 13:01:43 -0800 (PST)
Received: from hp.tailca3b3b.ts.net ([2001:67c:370:128:4595:f7da:56c1:448d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm26926677eec.22.2026.11.15.13.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:01:43 -0800 (PST)
From: Ferenc Fejes <ferenc@fejes.dev>
To: perfbook@vger.kernel.org
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Leonardo Bras <leobras.c@gmail.com>,
	Ferenc Fejes <ferenc@fejes.dev>
Subject: [RFC PATCH 2/7] utilities: Add EPUB3 post-processor and stylesheet
Date: Sun, 15 Nov 2026 22:01:33 +0100
Message-ID: <20261115210138.229034-3-ferenc@fejes.dev>
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

Add utilities/epub-fixhtml.pl to adjust Pandoc's unpacked EPUB3 XHTML
and SVG files: rotate landscape SVGs upright, cap tall portrait figures,
merge multi-snippet listings, apply table cell colors, lay out numbered
display equations, and wrap footnotes and Quick Quiz answers in EPUB3
popup asides.  Also add utilities/epub.css to style epigraphs, figures,
listings, tables, equations, and chapter headings across KOReader and
Foliate.

Signed-off-by: Ferenc Fejes <ferenc@fejes.dev>
---
 utilities/epub-fixhtml.pl | 80 +++++++++++++++++++++++++++++++++++++++
 utilities/epub.css        | 63 ++++++++++++++++++++++++++++++
 2 files changed, 143 insertions(+)
 create mode 100755 utilities/epub-fixhtml.pl
 create mode 100644 utilities/epub.css

diff --git a/utilities/epub-fixhtml.pl b/utilities/epub-fixhtml.pl
new file mode 100755
index 00000000..64428efc
--- /dev/null
+++ b/utilities/epub-fixhtml.pl
@@ -0,0 +1,80 @@
+#!/usr/bin/env perl
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Post-Pandoc XHTML and SVG adjustments for the EPUB package directory.
+#
+# Copyright (C) Ferenc Fejes, 2026
+#
+# Authors: Ferenc Fejes <ferenc@fejes.dev>
+
+use strict;
+use warnings;
+
+my $pkg = shift(@ARGV) or die "Usage: $0 <epub-pkg-dir>\n";
+
+sub slurp { open my $fh, '<:raw', $_[0] or die "$_[0]: $!"; local $/; <$fh> }
+sub spurt { open my $fh, '>:raw', $_[0] or die "$_[0]: $!"; print $fh $_[1] }
+
+my (%w, %h, %rot90, %fig);
+for my $f (glob("$pkg/EPUB/media/*.svg")) {
+    my ($n) = $f =~ m{([^/]+)$};
+    my $s = slurp($f);
+    ($w{$n}) = $s =~ /\bwidth=['"]([0-9.]+)/;
+    ($h{$n}) = $s =~ /\bheight=['"]([0-9.]+)/;
+}
+
+for my $f (glob("$pkg/EPUB/text/*.xhtml")) {
+    my $x = slurp($f);
+    $x =~ s{<span\s+style="[^"]*transform:rotate\(-90deg\)[^"]*">\s*(<img\b[^>]*\bsrc="\.\./media/([^"]+)"[^>]*>)\s*</span>}{
+        $rot90{$2} = 1; ($w{$2}, $h{$2}) = ($h{$2}, $w{$2}); $1
+    }gse;
+    $x =~ s{(<img src="\.\./media/([^"]+\.svg)" class="inlineimage" style="width:)(\d+)(%;?")}{
+        $fig{$2} = 1;
+        my $r = ($w{$2} && $h{$2}) ? $h{$2} / $w{$2} : 1;
+        my $c = $r > 1.15 ? int(65 / $r + 0.5) : $3;
+        $c = 25 if $c < 25;
+        $1 . ($3 > $c ? $c : $3) . $4
+    }ge;
+    $x =~ s{</code></pre>\s*((?:<span id="ln:[^"]+"></span>\s*)*)<pre class="verbatim"><code>\n?(.*?</code></pre>)}{
+        my ($p, $b) = ($1, $2);
+        $b =~ s/^(  \d+) (?=\S)/$1   /gm;
+        "\n$b$p"
+    }gse;
+    $x =~ s{<td([^>]*)>((?:\s*<p>)?)\s*<span class="cellcolor" data-bg="(#[0-9A-Fa-f]+)"></span>\s*(.*?</td>)}{
+        my ($a, $p, $c, $r) = ($1, $2, uc($3), $4);
+        $a =~ s/\s*background:\s*#[0-9A-Fa-f]+;?\s*//;
+        $a =~ s/\s*style="\s*"//;
+        ($a =~ s/style="/style="background: $c; / or $a .= qq( style="background: $c")) if $c ne '#FFFFFF';
+        $r = ($p ? "&#160;$r" : "<p>&#160;</p>$r") if $r =~ m{^(?:</p>\s*)?</td>$};
+        "<td$a>$p$r"
+    }gse;
+    $x =~ s{(?:<p>(<span id="[^"]+"></span>)</p>\s*)?<p>(<span id="lateximage-[^"]*" class="lateximagesource"><img src="\.\./media/([^"]+\.svg)"[^>]*/></span>)\s*<span class="eqnum">(.*?)</span></p>}{
+        my ($id, $img, $svg, $num) = ($1 // '', $2, $3, $4);
+        $img =~ s|style=""|sprintf('style="width:%.2fem"', $w{$svg} / 8.5)|e if $w{$svg};
+        qq(<table class="displaymath"><tbody><tr><td class="eqpad">$id</td><td class="eqbody">$img</td><td class="eqnum">$num</td></tr></tbody></table>)
+    }gse;
+    $x =~ s{<a\s+href="([^"]*#(?:footnote-[^"]+|QQA\.[^"]+))"(?=\s+id="fnref-|><strong>\[Answer\]</strong>)}{<a href="$1" epub:type="noteref" role="doc-noteref"}g;
+    $x =~ s{<p><a\s+(href="[^"]*#fnref-[^"]+")\s+id="(footnote-[^"]+)">(.*?)</p>}{<aside id="$2" epub:type="footnote" role="doc-footnote"><p><a $1 epub:type="backlink" role="doc-backlink">$3</p></aside>}gs;
+    $x =~ s{<p><span id="(QQA\.[^"]+)"></span>(?:</p>\s*<p>)?(<strong>Answer:</strong>.*?)<a\s+(href="[^"]*#QQE\.[^"]*")>(❑</a></p>(?:\s*</li>\s*</[uo]l>)?)}{<aside class="quiz-answer" id="$1" epub:type="footnote" role="doc-footnote"><p>$2<a $3 epub:type="backlink" role="doc-backlink">$4</aside>}gs;
+    spurt($f, $x);
+}
+
+for my $f (glob("$pkg/EPUB/media/*.svg")) {
+    my ($n) = $f =~ m{([^/]+)$};
+    my $s = slurp($f);
+    my $orig = $s;
+    $s =~ s{(<svg\b[^>]*?\swidth=")([0-9.]+)(pt"\s+height=")([0-9.]+)(pt"\s+viewBox="0 0 )([0-9.]+)\s+([0-9.]+)("[^>]*>)(.*)(</svg>)}{$1$4$3$2$5$7 $6$8\n<g transform="translate(0,$6) rotate(-90)">$9</g>\n$10}s if $rot90{$n};
+    $s =~ s{<svg\b([^>]*)>}{
+        my $a = $1;
+        if ($w{$n} && $h{$n}) {
+            $a .= qq( viewBox="0 0 $w{$n} $h{$n}") if $a !~ /\bviewBox=/;
+            if ($fig{$n}) {
+                my $th = int(800 * $h{$n} / $w{$n} + 0.5);
+                $a =~ s/\bwidth="[^"]*"/width="800pt"/;
+                $a =~ s/\bheight="[^"]*"/height="${th}pt"/;
+            }
+        }
+        "<svg$a>"
+    }se;
+    spurt($f, $s) if $s ne $orig;
+}
diff --git a/utilities/epub.css b/utilities/epub.css
new file mode 100644
index 00000000..c30a3f0f
--- /dev/null
+++ b/utilities/epub.css
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/* Chapter/section epigraphs (see reflow.ltx): right-flushed narrow box
+   with ruled small-caps attribution, like the print edition. */
+figure.epigraph { margin: 1.5em 0 1.5em auto; max-width: 27em; font-size: .85em; text-align: left; }
+figure.epigraph p { margin: 0; padding: .25ex 0; text-indent: 0; }
+figure.epigraph figcaption { border-top: 1px solid #A0A0A0; font-variant: small-caps; font-size: .92em; margin-top: .5ex; }
+figure.epigraph figcaption, figure.epigraph figcaption p { text-align: right; }
+
+/* Figures: center all images and captions, cap width at 85%, and keep
+   captions attached to their images across page breaks. */
+figure.figure { text-align: center; margin: 1.2em auto; page-break-inside: avoid; break-inside: avoid; }
+figure.figure p { margin: 0 0 .4em 0; text-indent: 0; text-align: center; }
+figure.figure img.inlineimage { display: inline-block; margin: 0 auto; max-width: 85%; height: auto; }
+
+/* Listings and tables: use smaller relative font sizes to minimize line
+   wraps while scaling with the reader's user-configured font size, and
+   avoid scroll boxes (WebKit-based readers like Foliate paint only the
+   first page of an overflow:auto box split across pages). */
+figure.listing, figure.table { margin: 1em 0; }
+figure.figure figcaption, figure.figure span.figurecaption,
+figure.listing figcaption, figure.listing span.figurecaption,
+figure.table figcaption, figure.table span.figurecaption {
+  display: block; text-align: center; font-size: .9em; margin: .35em 0;
+  page-break-before: avoid; break-before: avoid;
+}
+figure.listing.ruled { border-top: 1px solid #A0A0A0; border-bottom: 1px solid #A0A0A0; padding: .35em 0; }
+figure.listing pre { margin: .35em 0; }
+figure.listing table td { font-family: Menlo, Monaco, 'Lucida Console', Consolas, monospace; }
+pre, table { overflow: visible; line-height: 1.25; }
+pre { font-size: .75em; }
+pre code { font-size: 100%; overflow-wrap: anywhere; }
+kbd { font-family: Menlo, Monaco, 'Lucida Console', Consolas, monospace; font-size: 85%; }
+table { display: table; width: 100%; font-size: .8em; }
+th, td { overflow-wrap: break-word; padding: .2em .35em; text-align: left; }
+td.tdc { text-align: center; }
+td.tdr { text-align: right; }
+tr.hline td, tr.tbrule td { border-top: 1px solid #808080; }
+tbody tr.tbrule:first-child td { border-top: none; }
+tbody tr.tbrule:last-child td { padding: 0; }
+td.tdrule, td.tdrulel, td.tdruler, td.tdrulelr { border-top: 1px solid #A0A0A0; }
+td.tvertbarr { border-right: 1px solid #808080; }
+td.tvertbarrdouble { border-right: 3px double #808080; }
+th p, td p { margin: 0; text-align: inherit; line-height: inherit; }
+
+/* Numbered display equations: center math expression and flush equation
+   number to the right margin while scaling math with the body font. */
+table.displaymath { width: 100%; margin: .8em 0; border: none; border-collapse: collapse; font-size: 1em; page-break-inside: avoid; break-inside: avoid; }
+table.displaymath tbody, table.displaymath tr, table.displaymath td { border: none; padding: 0; vertical-align: middle; }
+table.displaymath td.eqpad { width: 12%; }
+table.displaymath td.eqbody { width: 76%; text-align: center; }
+table.displaymath td.eqbody img.lateximage { max-width: 100%; height: auto; vertical-align: middle; }
+table.displaymath td.eqnum { width: 12%; text-align: right; white-space: nowrap; }
+
+/* KOReader: never typeset Quick Quiz answers as in-page footnotes (they
+   would spoil the answer below the question); tap-to-popup still works
+   because detection uses the epub:type/role attributes. */
+aside.quiz-answer { -cr-hint: none !important; }
+
+/* Each chapter is already a separate spine document (Pandoc --split-level=1);
+   override Pandoc's default h1 { page-break-before: always } so headings
+   inside a chapter file never force an extra page break. */
+h1 { page-break-before: auto; break-before: auto; }
-- 
2.55.0

