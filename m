Return-Path: <SRS0=4SL/=IX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ae/h9GLAEru1VOtDQug6mZz+PXpKcLPNQlPlzcNEb6o=;
        b=H5AAE9JXs5zsJ3Crte9X1KQMdJl1F/D20nM4EDekjJMQhykT0u7Z97nlngUye+5ln4
         wNku5b9UDaLE5Z8KggigyLiWcfUlIeq/wZfpNNqUGch5Zw68nAEuciID4qOm8aLikroo
         uJabi5v/L5VEIfdIX5T47t6zxGxt46fLHnI+bDatW7evre0s9O9PJxWcK4sCtELQRujQ
         ct9QQBsyXOJdwVe8M+FMSgMelJtqvAGrKUBuzgE4+vqBYLKBrkkmZro3iDKjZ+s8zAWU
         ghMYKoiClrAc+8Dn4iU5wZGWawZwHRWyUnuxR7rZEDzH2CuO+4aT5tvMlx/uRMwJzVkN
         06Aw==
Subject: [PATCH -perfbook 0/5] ebook reader size support
References: <20210323010153.GH77072@balbir-desktop>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
Date: Thu, 25 Mar 2021 19:49:44 +0900
MIME-Version: 1.0
In-Reply-To: <20210323010153.GH77072@balbir-desktop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Balbir Singh <bsingharora@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Balbir and Paul,

So, this is a revised patch set based on the RFC PATCH from
Balbir.

Hearing no objection to the rename of "-er" to "-eb",
I did the rename in Patch 1/5 of Balbir's.
Patch 2/5 is an updated one I sent earlier, with additional 
float-barrier macro for ebooksize build and minor tweaks.
Note that the extra blank line at the bottom of \ebresizeverb
is now fixed.
Patch 3/5 is also an updated one I sent earlier.
Patch 4/5 shrinks floats in styleguide.
Patch 5/5 updates help text in Makefile to mention build targets
for ebooksize.  They are marked as (WIP) for the moment.

This set can be applied to current master.

       Thanks, Akira

--
Akira Yokosawa (4):
  perfbook-lt: Add macros to shrink floats for ebook
  cpu, toolsoftrade, count, rcuapi: Shrink floats for ebook reader
  styleguide: Adjust float size and add a floatbarrier for ebook-size
    build
  Makefile: Add info on ebooksize build in help and help-full

Balbir Singh (1):
  perfbook/papersize: ebook reader size support

 Makefile                           | 21 +++++++++-
 appendix/styleguide/styleguide.tex | 12 ++++++
 count/count.tex                    | 15 ++++++--
 cpu/overheads.tex                  |  2 +
 defer/rcuapi.tex                   | 12 +++++-
 perfbook-lt.tex                    | 62 ++++++++++++++++++++++++++----
 toolsoftrade/toolsoftrade.tex      |  2 +
 7 files changed, 111 insertions(+), 15 deletions(-)

-- 
2.17.1


