Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=references:cc:to:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=LlEnaoex202IsiZuqxju4EZQZEr+BDWt0CmZkJGIkPc=;
 b=uNtcEH84CLeKoEng6zQ2I9uHlcYS7ROhaYELmHAl8Ye/XMfHH3epzdKd5GP3I+olyh
 cRyTcSfOME2BQuH/J6+JlYbLmsgpZ3qUwXHA3xqDMAJfYFZt4Pxt3nvm3ZjipfLYKABi
 MXQcZi0em/W1dJIoF7eKOsCYnQKhLJORoesQ8lYrRm4R6Cmvl3cUiJiPrEUEW5fvUlo8
 rGqG6jHsraELWZb/LMb45hqwL+TB7x8ZWGc7hNR8vYLjCidS/3F158NsKhf7fy11tdeC
 YA/MXfJw6lWSmfYXte5WaTnO7iY/d1/aHsu6dBfhuR2SUjFtUaUlIwwbHqLwodZaJt/D
 wQng==
References: <d4e3f6ba-bdc9-fa85-7404-f189adfb6436@gmail.com>
 <20170323153558.GD3637@linux.vnet.ibm.com>
 <c7a6f457-3914-9e5e-a42a-29e9b8f67b77@gmail.com>
 <20170324181239.GJ3637@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH v3 0/2] Follow up patches to FAQ-BUILD update
Message-ID: <c1873081-9760-6b3c-f382-cabf8071f96d@gmail.com>
Date: Sat, 25 Mar 2017 07:52:09 +0900
MIME-Version: 1.0
In-Reply-To: <20170324181239.GJ3637@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 085049a61d22e462f9c5d8e04f9be20f2ec558ce Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 25 Mar 2017 07:43:56 +0900
Subject: [PATCH v3 0/2] Follow up patches to FAQ-BUILD update

Hi Paul,

I squashed the patches to FAQ-BUILD.txt.
Does this set work?

                             Thanks, Akira
--
Akira Yokosawa (2):
  FAQ-BUILD.txt: Fix misinfomation crept in wordsmithing
  Add another build error check

 FAQ-BUILD.txt              | 11 ++++++-----
 utilities/runfirstlatex.sh |  6 ++++++
 utilities/runlatex.sh      |  6 ++++++
 3 files changed, 18 insertions(+), 5 deletions(-)

-- 
2.7.4


