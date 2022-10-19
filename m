Return-Path: <SRS0=So6Q=2U=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuH0O2FHuCUD1oIWzcUGIjzJsDepLiqacIgI7zEPSEw=;
        b=f/7TuiUX7C/8vHN7LKuy1BjnhRWDBPrw0Ayt3Uy4hvDfw4LNKOXNvrlDN+jqRGGr5U
         v2R7KGxKEOWgph9CBVo49G0OYIZixGO+41QL2IKTguh0I+Q0U7nWPDrc3iwrjQKdSRyy
         Z1e0ZfFTtMuhMHIZs+66XCqGZysY3XnkZoyHmJ0wHe8jPLtuutgjmD8H/KO2XrtTQnEq
         g2CAtQPVv9FgYYW+fU7rlXFBPBAOzecvURT9/F5GbN98IwQJJPc+gmG2kMTwhme7q6N8
         cEf+JFKySgAGCYlirF+SL8RnjkW2CowcbDSUVLAnd06+Hbz+LVenDy2HmOoQ3ODhedPa
         dgtQ==
Message-ID: <db2a9f79-dcf9-6d04-3517-be4317fed1bd@gmail.com>
Date: Wed, 19 Oct 2022 22:47:53 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] Stick to mfirstuc v2.07
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Version 2.08 of LaTeX package "mfirstuc" (indirectly loaded via
"glossaries-extra") is a re-implementation using modern LaTeX3
commands.

Unfortunately, it is not compatible with our indexing macros and
build scripts due to the use of mfirstuc's internal macros.

Newer versions of mfirstuc understand an option [=v2.07] and roll
back to the earlier version [1]. Therefore, as a work around, load
it explicitly with that option before loading glossaries-extra.
It does not affect builds on a system where an earlier version
of mfirstuc is installed.

Link: [1] http://mirrors.ctan.org/macros/latex/contrib/mfirstuc/mfirstuc-manual.html
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

A recent update of mfirstuc broke perfbook builds.
Looks like I had trespassed the mfirstuc's internal code when
I tweaked the automatic capitalization of indexed terms/names.

In LaTeX community, LaTeX3 provides an easier-to-program syntax for
package writers and it is getting popular day by day. Most of those
re-implementation have not affected perfbook, but here comes such
a day.

In the longer term, I might be able to come up with a better
approach for future compatibility. I can't promise anything at the
moment, though.

        Thanks, Akira
--
 perfbook-lt.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 9cde2e4d42e5..80e36084ed3b 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -79,6 +79,8 @@
 \usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0},linktoc=all]{hyperref}
 \usepackage{footnotebackref} % to enable cross-ref of footnote
 \usepackage[all]{hypcap} % for going to the top of figure and table
+\usepackage{mfirstuc}[=v2.07] % v2.08 or later is not compatible with our
+                              % indexing macros
 \usepackage[acronym]{glossaries-extra}[2020/02/13]
 \usepackage[longragged]{glossaries-extra-stylemods}
 \usepackage{epigraph}[2020/01/02] % latest version prevents orphaned epigraph

base-commit: c2dc57ae109050a8a252278c73158292bb4b9512
-- 
2.25.1


