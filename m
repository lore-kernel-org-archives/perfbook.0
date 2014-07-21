Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-vc0-f176.google.com ([209.85.220.176]:37823 "EHLO
 mail-vc0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with
 ESMTP id S1753710AbaGUIY0 (ORCPT	<rfc822;perfbook@vger.kernel.org>); Mon, 21
 Jul 2014 04:24:26 -0400
Received: by mail-vc0-f176.google.com with SMTP id id10so6856936vcb.35 for
 <perfbook@vger.kernel.org>; Mon, 21 Jul 2014 01:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=mime-version:date:message-id:subject:from:to:content-type;
 bh=+sON9SSqJDGylJt6MLgkBkBHM73dW0O+v1sTReB0ovM=;
 b=y/+t+RNKeiLnSpd5lq4vPS4jEIpEpZIRnD7Oc/3glqtITtj5EfTDtrE2zeDz/jUpni
 Gc5rEBrvw5NHQJGS4In/7yBGHlsh6BTQp1fQr5Eb2679446S1mnFdkVQmDAPIWMnZKgH
 CloCvz4dZXP0gaF3HnO9d2Aiko0P/YpTW3yp9dEGIBBzhe7zVncYu/BkKC6/0u8Ns7dz
 KMDVbd/lRGjhucy2osm1e4caKNKeLmy3iksNvjaH/8u11CGq30MgsYHxx8yx0kmWpn+A
 DKoBrov82u4fJzkqRD5yZEKmFrs2HJQpltnaU+h1ksfz41kftRYp9G85zxplfPYUGy7e
 b8tQ==
MIME-Version: 1.0
Date: Mon, 21 Jul 2014 16:24:26 +0800
Message-ID: 
 <CAOArY3XAD986MWLXcnG3VsYk40jyRgK8N+aWHniOnNJUTbmy9w@mail.gmail.com>
Subject: Error report: perfbook Section 11.6.3.2
From: Isaac To <isaac.to@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hi,

Thanks a lot for the free book, it is very useful!

I'd like to point out an error I see in Section 11.6.3.2, after Quick Quiz
11.10.  It says the following:

  Suppose that a given test fails about once every hour, but after a bug fix,
  a 24-hour test run fails only twice. What is the probability of this being
  due to random chance, in other words, what is the probability that the fix
  had no statistical effect?

In other parts of the book, care has been taken to say something like
"confidence level" to make the probability statements correct.  Not here.

The only thing that we know about the probability of failing after the
experiment is that "the probability of the test failing now is not zero".
To know the "probability of this being due to random chance", or
"probability that the fix had no effect", requires the knowledge of the
behaviour of the bug itself (or, at least, the prior probability that the
perhaps buggy system has a certain behaviour), and it is not specified in
the question.  E.g., in an extreme world that the test can only fail at a
rate of once every hour or never at all, we must admit that we are very
very lucky during this particular test.

The probability being calculated needs to be specified like "the
probability of this happening *in case* the fix has no effect".  That "the
fix has no effect" needs to be a *prerequisite*, and cannot itself be the
probability to be computed.  The complement, i.e., 1 - 1.2e-8, is "the
confidence level that the probability of failing is less than the
original".  I'd suggest using the "confidence level" wording here, but
explain what it is earlier in the book to tell the less mathematically apt
readers understand the wordings.

Regards,
Isaac
