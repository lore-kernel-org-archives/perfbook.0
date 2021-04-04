Return-Path: <SRS0=ALPs=JB=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=3/hlaq5T88cIsI71YSNUjhJTrRwpqAU9kCLEB0+gjZ4=;
        b=ftu7e3UKdIR7HFhqe/YAGgz4qtF0ToLfahpNh6HxOGXct6JpnWYwGlcGWMVPpRefZ/
         XrpBbSGunjNN/Mjc5WfmPIwA4OEtGWgCV5gfrD3Fm2XfRfo6kjpXW6YK0ES5Yb9YEFCr
         hJzdHiJB8BVkbBk+b7nLtQW1E04bkhbxbMcI7UopJI/+PJKd3HHwDNNj33BE+oKJbFQR
         Xm0rguuxdOezOPnBbG5g1jh9kk5Gp/Xs8dKxD0la39o2CiefrwqqxOuk/Q1TIB9L7CSQ
         c/F6dT6UUq+lG27hT/Rt57OHAej6v5YODbldawHMxNTIazMBA+ggpHEws5/ns0OBqpWp
         hfYw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 0/4] Trivial fixes for 'howto' chapter
Date: Sun,  4 Apr 2021 09:50:06 +0200
Message-Id: <20210404075010.15858-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This patchset fixes trivial nits in 'howto' chapter.

SeongJae Park (4):
  howto: Use '\cref' consistently
  howto: Add missed `~` for Paul's name
  howto: Provide a hyperlink to 'submitting-patches.html'
  howto: Fix a typo (License -> license)

 howto/howto.tex | 45 +++++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 22 deletions(-)

-- 
2.17.1

