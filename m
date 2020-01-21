Return-Path: <SRS0=tsBt=3K=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=4OrE+H6/qi6Qs93PQfrRHragvPyNF8NgLH/X6ZgJE4k=;
        b=f1AZxuAd0TFLUGO4G//uYhJ9cNnApb9Wlgbk4TKZm6X8yMkNpIh20T0x+E7WGl0f1N
         wPbZTMkuf0fz4DFevmxrB/muv7M8zp3uVgnS1QccSpqTlgonS9OehdAGQJyVTX4jHilU
         M7LI3krwMX5+sVKuaaUIojiiRqEUoOEikBBALEjUHJDnxm9/jElVSk7mg9uZXkRXV5XD
         eOM4NEanSv/U4CPad4FAFc9VlZVIZehrXWa9OeYO3lCkQnsxvgJC2C4AqE1FWDgHhgle
         f/glGgezipZWNkT82h6AiK5vGl9MIDuzR3wBHn+FD/85nD6DjhUQw0LHmXpqeXiyv4ph
         0o7w==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/2] count: Prevent line breaks in the middle of 'and n.m'
Message-ID: <c9d3fde2-92e4-f65a-bcd9-5c81271a1727@gmail.com>
Date: Wed, 22 Jan 2020 07:34:26 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Patch 1/2 is a conservative application of \cref{} in count/count.tex.
I observed the line breaks in 2C layout while I tweaked Figure 5.8.
As it involves changes in a label string which has quite a few
referenece site, its size becomes larger than I expected.

Patch 2/2 is a follow-up patch to move floats away from top of
sections.

      Thanks, Akira
--
Akira Yokosawa (2):
  count: Prevent line breaks in the middle of 'and n.m'
  count: Move floats away from top of sections

 count/count.tex | 84 ++++++++++++++++++++++++-------------------------
 owned/owned.tex |  4 +--
 2 files changed, 44 insertions(+), 44 deletions(-)

-- 
2.17.1

