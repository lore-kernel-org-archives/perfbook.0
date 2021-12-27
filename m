Return-Path: <SRS0=M9fC=RM=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=P1ri75fAnM6Et/VGImLkmPHOq675t+iYNMVNXx2g/Kw=;
        b=nVFsPv91pzb04KudxX6kS8n17ZXR+c+wRjtlj7TKO3cqwj7ox9eZxksBH+J0FTaWP5
         sPW4O6+QLOoX/YowKWEFDVf4qhehmygJ68q2FRfINzKVeOSCsI48eWcmesIeg5GAHTFm
         UTZMiqqPvan4sgowCWlBUs0+rJbVe2TJ+tGGjlD1FwQL/UKVMy4TT85MS7PZIFMHUdpB
         gg9JzIAnBgkL48Fehla6wAiYQx0DFADNcNQCtEJ2gjis3lN2QF/ZC8qnkoTO7eIfIZWG
         Lqw/Png9uqdLczcuwc66faDGa/qE9bWYh2guzFiqRW+jzEspcAKJbeOEk0FXaIxSjom4
         9sFg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 0/2] count: Fix trivial nits
Date: Mon, 27 Dec 2021 09:52:11 +0100
Message-Id: <20211227085213.9246-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This patchset contains two fixes for trivial nits in 'count' chapter.

SeongJae Park (2):
  count: Adds a missed unbreakable space
  count: Add missed parentheses for balance_count()

 count/count.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.17.1

