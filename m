Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:34047 "EHLO
 mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751213AbdEIFIz (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 9
 May 2017 01:08:55 -0400
Received: by mail-pf0-f194.google.com with SMTP id w69so6603335pfk.1 for
 <perfbook@vger.kernel.org>; Mon, 08 May 2017 22:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=eB3/Doi4Y3BvIrx67yM9++vmN5aCj7YSuAkbcAZOA5Q=;
 b=TzugR5yWT5Qaoq8C/Ejph/i9tg8RbY8kiTe7iVdQoEMewuo8plHdzocFK6ntdqjvtD
 4LfBZM/5SkcSJcLVxddqzF3osymKwbaAVsPOplFT4bM6pcsZITdHcLy4/9BPsciz9qwV
 wjN3gpWt8IRyZ1VZdu8A0l4bed5RRp4L1kCyYeUOctBBWMsHMoenby8QDf4EIjl4Y6qw
 xHtJ0uPhrL12up/ZvEK1o3/ETeoPR2smHMR/mjJf6l3sDTsa92a3/lvUrQZAFPAVBNx3
 hSGcdQas3K0qtd5OE27/XVEb7Q+J9hxiHzNk1OgbrtgTZUmdHujOg2bik+CZznL67xX3
 HLqA==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 0/2] Reviewing CodeSamples/count/count_stat_eventual.c
Date: Tue,  9 May 2017 13:08:29 +0800
Message-Id: <1494306511-9022-1-git-send-email-junchangwang@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Junchang Wang <junchangwang@gmail.com>

Hi Paul,

Thanks for this excellent book. I enjoy reading the book very much(especially the Q&A
part), and have learned a lot from the first a few chapters.

I will post patches and questions while reading the book. Definitely, I'm not an
expert here, so please help correct if I misunderstand anything. Thanks!

Junchang Wang (2):
  Replace definition of variable sum from int to unsigned long
  Remove unnecessary memory fence

 CodeSamples/count/count_stat_eventual.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.7.4

