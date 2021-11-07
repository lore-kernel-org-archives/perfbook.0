Return-Path: <SRS0=tN3q=P2=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=72HTmFin985wBn6hxbXPpS/fbB49AKWZzErsH41Mvno=;
        b=qP9OsJny94n426YYIuWE0xIHsqrW5W7d9G6y0ETbDUfaIpN/UXmRf8DyW5B9rVDZXP
         IUvn9HzADaVq/PWZ0eaqmR/QQOCX+HyTgeBy4kN/TsyYOCE94RD2K6NX1DFkLVCGPAM5
         ykt3hdwZUPwtRlclphj3UeEyIUsPvkqGIF05ZgW89vZ0nTpxU8FZKfs6pM9ceIR6DcvC
         SJAKchfXR4W0KZD6WmJyTUFy3Yz2D27KJoeiabr7y5AS0NEY6Tc1gTPg+jzJxc4Xwau/
         nLgKklOoUQWZgyRfgV0En8EWXz0uuZlPFcyFY+3iILT7xiiYuI7FiE/5WBE/H1Zaz5pP
         NAPg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] docker: Stay with Fedora 34
Message-ID: <af676f98-034c-658e-5ff0-890b0f267d18@gmail.com>
Date: Mon, 8 Nov 2021 08:41:26 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The container image tag of fedora:latest has advanced to fedora:35.
However, current distro packages of Inkscape and pango on Fedora 35
are not compatible with each other and multi-line text in SVG are
not rendered properly [1, 2].

[1]: https://gitlab.com/inkscape/inkscape/-/issues/2864
[2]: https://bugzilla.redhat.com/show_bug.cgi?id=2018036

Explicitly use fedora:34 for the time being.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 docker/Dockerfile.fedora | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docker/Dockerfile.fedora b/docker/Dockerfile.fedora
index 91633948..c2af8d11 100644
--- a/docker/Dockerfile.fedora
+++ b/docker/Dockerfile.fedora
@@ -1,4 +1,4 @@
-FROM fedora:latest
+FROM fedora:34
 
 RUN dnf -y update && dnf install -y --setopt=tsflags=nodocs \
     fig2ps graphviz inkscape make git vim nano gnuplot-minimal groff time \

base-commit: 2f38b15c1e6e35a374c51ec07fd02c0a33e62219
-- 
2.17.1

