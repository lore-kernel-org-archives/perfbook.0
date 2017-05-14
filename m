Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:34354 "EHLO
 mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752248AbdENPCT (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 14
 May 2017 11:02:19 -0400
Received: by mail-oi0-f54.google.com with SMTP id b204so107541111oii.1 for
 <perfbook@vger.kernel.org>; Sun, 14 May 2017 08:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=mime-version:from:date:message-id:subject:to;
 bh=7ryRSOMo7fUldvzBia6fmf7aNaLoC4yq674HRIcvZ54=;
 b=M+vu/BXbgl3lkf73T2WSw8AJAgwR13yHkaNz2Jl+mTF80ooDtu/d9p/9obdeQWqCYa
 CPQ3WLoFENbyp9hwDRduTTQhnvNYjgpSf/vjz3zgwq/58xVW4Ym+5yYI3DcG+SKVPKL7
 SEqgGJ355O8iIA3WCIiLUMvS7uqKZo+S0ZoJackVYoE3jTO/3ptJ516VbwJtv/Uqi+ax
 Pad9H10/Aqj32fjKHXCVrePLSGD48aMPIxa+0p1yjZ7ZGly1RiPBF3lPe6ZUa2aR9Ojy
 76eA/hsabtkBRRYUsTQtM0ZJVK1cRs+CqBiMPVSY4ijbUiOyIfFHTLHPtbSVuqhnChfR
 kPMA==
MIME-Version: 1.0
From: Junchang Wang <junchangwang@gmail.com>
Date: Sun, 14 May 2017 23:02:18 +0800
Message-ID: 
 <CABoNC812ZneaAkQ7EERgcz6y3OOaY+03ybNfX_0jYxZ2Fed2BQ@mail.gmail.com>
Subject: Question about performance figures in Section 9
Content-Type: text/plain; charset="UTF-8"
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hi list,

I'm reading Section 9 which is excellent. I have one quick question
now. For performance figures (e.g. 9.16 on page 178), what's the
pattern of add/del being performed? Are we assuming a mostly read
rarely write scenario? I'm totally fine if that's the case. Just want
to make sure.

Thanks,
--Jason
