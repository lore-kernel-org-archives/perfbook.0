Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mail-oi1-f177.google.com ([209.85.167.177]:41875 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727287AbeJAJ7I (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 1 Oct 2018 05:59:08 -0400
Received: by mail-oi1-f177.google.com with SMTP id l197-v6so9980955oib.8
        for <perfbook@vger.kernel.org>; Sun, 30 Sep 2018 20:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=rIQgbq0ZsdRpWTFkVxJEyMzbyBOstQSM5XbA3KhH5B8=;
        b=FWnB/vot0oVd2shNWZSnWvNiRJpTFXz/Zx96/Bk6maiZwFsrpFv0OVceCUax2pjX0z
         Z7LL8N16V65zDcujsH7UQFSdZviGIj5koXT2fRjRDZX3VJk5kAnpIm4zBdvUD2AK1wKZ
         e1SLnaEXTQ/+G23Kp/6NuOd0inLN0HlEu7oYcb2ANB1g3+TYt52J01hrpLcfGL9NwMKI
         2/Q9sFUErL1haN2LMjTVyhAsPM9SNDhPPip848NIrn4PfWe7kbzLpDC8vD+5/nct+Kg8
         KeSrQpg/rMRS5Tq3cQ4rhfJMiMQJa9o5vqsMWgPO61hEMnivZY97h7d5t+XMNy1fkiz+
         vZRA==
MIME-Version: 1.0
References: <CABoNC81BJOPV3oBQ-Q9m9-5VZAdWq0L_r+4m6Wv7QWuXQo1LnA@mail.gmail.com>
In-Reply-To: <CABoNC81BJOPV3oBQ-Q9m9-5VZAdWq0L_r+4m6Wv7QWuXQo1LnA@mail.gmail.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Mon, 1 Oct 2018 11:23:17 +0800
Message-ID: <CABoNC82ftdi_Ki-zhwv2xC1HVC4=O-wGvF+wS+MSCEa8ETctXQ@mail.gmail.com>
Subject: Fwd: Other architectures we can work on?
Content-Type: text/plain; charset="UTF-8"
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Forward to list perfbook since the last mail was blocked due to the
non-plain-text issue.


Hi Paul and list,

I'm again reading the excellent 15th chapter (Advanced
Synchronization), which helps me eventually understand how a
hardware/compiler can optimize--and hence ``break''-- my parallelized
code :-).

I really want to get my hands dirty and to test my code and samples in
perfbook on real servers. However, all servers in my lab are x86. I
wonder if there is any chance that we can have access to architectures
other than x86 to test code. For example, are there any cloud service
that provides access to POWER or ARM architecture?

Thanks,
--Junchang

