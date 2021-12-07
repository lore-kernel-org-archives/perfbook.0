Return-Path: <SRS0=gBsV=QY=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=GrUIZpc7XkQ2EbeaYHGIgYR40eWvSP9n+E7U9c9N6zk=;
        b=W6TqcgiqzFcRsPzGDn4jkMrQ2xLFcskkZHSUKTS+HJILGXYXuWslTzMML6Yt1u3ig9
         lEg4rJ5kVVWup0QRQ34z6YWvaHMmdTVsfIyZqsalWRQ3s3jorqh4E6U5D7zOs3oo9svG
         ekK6l0I05kHqr/egZoOqIKibGzLqankh9i1jw01xU6DVdLSMGx1+wwbZFGYX1HAlgcw+
         USky48H3WrRGl5IEehxgckCM68jctX4zzgD1OYiMptz6JrtUNcz7qQO4krTPNsIgKzQg
         sV/nNyd/TCMxCUGT9n83kCevfdD4jfhHAKnLXxYgb8kOhp7tzbj1nv/mWIIeUgd3st1e
         DRrw==
MIME-Version: 1.0
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Tue, 7 Dec 2021 10:07:58 +0800
Message-ID: <CAABZP2x9SCeYLLnpe1LCt4BqhYpJcR+vQQt_rN94ahubPWo0dQ@mail.gmail.com>
Subject: My learning experience of how irq_disable affects Linux IPI
Content-Type: text/plain; charset="UTF-8"
To: paulmck@kernel.org, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

During the study of RCU, I encountered confusion about how X86's
irq_disable affects Linux IPI delivery.  So I spent a week trying to
find out the fundamental mechanism by debugging the qemu virtual
machine. I think my experience may help others, and I guess the
perfbook mailing list is the best place to share my experience. Please
correct me if it is improper.

I learn how Linux IPI is blocked by irq_disable by means of debug qemu
virtual machine:
Fig 1 (https://ibb.co/Ypv3hNm)  CPU 1 sending IPI;

Fig 2 (https://ibb.co/162sVyV)  CPU 0 receive the interrupt;

Fig 3- Fig4 (https://ibb.co/bzFkckM, https://ibb.co/TmC3rn4) but CPU 0
has irq disabled, so the IPI will not be served at that moment;

Fig 5 (https://ibb.co/k8BpBMq)  CPU 0 enable irq;

Fig 6 (https://ibb.co/zNBrMJk) now IPI got served

Thanks for your continuous encouragement ;-)

Thanks
Zhouyi
