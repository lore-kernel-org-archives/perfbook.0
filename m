Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=FbGZhwdigUq9u4CHNYSRSj1e9ixTQipLVJ5ib73QYEs=;
 b=a3G6gj2yBDvhHywpHkkUiKjqEmMfUWByZWKGQwOufAB1RP0lTl8nWG/DD6jLKS4afJ
 N+K9gCCTtVWriYXh1A90xJ/vWVp6i2whcB0Hl+60t6fHTJkccRmfX9Ce3JhA+ge71nxv
 tUUq1ck+zIIYos6AIoi+2tbNxIIpt3pi0QXMZx/xUkXgdTFhS24b7NanO9gdmb1r/DG/
 +/GgQ2h/5GavHKVj/GIGDtDQgYgqaJ48dwGcraNjHB1EeBpOToEbyAYh5gZjlwhRi9Xj
 G9/N22wUG2xQBZvRxv/yMHzk0Yqlczzc/TeTDsBcv7r8nxbDWRrbeJkDHNuasfvwl0A+
 ZeVw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/2] Enable inlinelinks of alphapf.bst for 1c
Message-ID: <f75680a3-5af7-4c3f-eeb1-f6e13d739f87@gmail.com>
Date: Wed, 28 Dec 2016 00:25:48 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3f4f73d738b77422bd074322f3ac67f644a8d580 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 28 Dec 2016 00:10:28 +0900
Subject: [PATCH 0/2] Enable inlinelinks of alphapf.bst for 1c

Hi Paul,

On 2016/12/26 16:39:52 -0800, Paul E. McKenney wrote:
> On Mon, Dec 26, 2016 at 11:52:40PM +0900, Akira Yokosawa wrote:
[snip]
>> One idea is to use alphapf.bst only for 1c with inlinelinks enabled. 
>>
>> Thoughts?
>
> I am good with enabling alphaph.bst inlinelinks only for 1c!

So, this patch set does the change.
For 2c, we reverted to the original alpha bibliography style for the
moment.
And I'll keep polishing the band-aid script to shorten the href-ed part
in titles. You might want to try it for 2c when you do a release.

                                                  Thanks, Akira
--
Akira Yokosawa (2):
  Makefile: Fix .bbl dependency
  Enable 'inlinelinks' option of alphapf.bst for 1c layout

 Makefile              | 4 ++--
 alphapf.bst           | 2 +-
 appendix/appendix.tex | 6 +++++-
 3 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.7.4

