Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=KECvrbw85snSkaiBWiAa1JYGcvB+gThcc5p0kzoRUCc=;
 b=OLlvNSWpFCTwaJynwGkX7ZrcC6BHJ+wvOCKh6jiRrKlsjTn5mAi34r8y7iu9zjGpX3
 sLtC/rhRVWl6WZnRJj54uRI7NoA6DN+v838mjh07XMnskhGKyf4JszQvo3jKtJYazbEs
 mMm9FlZA8/zc5OKApcdV0QDrgFjVjgGrmTflnErKP9ZWEYc1Qw+q8GJDGw4F78jywB0V
 K3iYVkIJQEhw5gvmsUrYtRVCXU0P05zP1K8CtuC1uExxANm+0i95jbQ/vgoSY2sBv6ap
 fumrTHEpCbwYrSp3g2oudQ+8lHfiDUw1blu5fvQt7zr8NzupOokOpfXgp53SB/24pkSd
 Pqwg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Some questions
Message-ID: <c95dbdd5-69f5-76f3-b678-08e78032ffd2@gmail.com>
Date: Thu, 28 Apr 2016 00:21:48 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi, Paul.

The quotations recently added at the top of Chapters look really nice!
They make perfbook look more like a full-fledged publication.

However, the newly added Table 14.2 "A Variable With More Simultaneous Values"
seems like it is not complete yet.  Is that the case?

Looks like you used some custom script or something to generate the table
from a raw data that contains when each cpu sees the updates.

Do you have a plan to replace the Table with a Figure something like
Figure 14.5 "A Variable With Multiple Simultaneous Values"?

If you do, I'll refrain from touching the Table. Rather, I'd be interested
in improving the script you might be using, if any.

Another totally unrelated question is about the URL you placed in
Section C.7: "http://www.openvms.compaq.com/wizard/wiz_2637.html".
Sadly, this URL is no longer valid. Do you happen to aware of an alternative
URL still accessible today?

By looking up a Wikipedia article, I found a page at
http://h18002.www1.hp.com/alphaserver/technology/chip-docs.html,
which is "Archived technical documentation library" of Alpha
containing links to technical documentation for Alpha microprocessors
and Alpha ATX motherboards. Is there a document there which can be
referred to instead of the above mentioned URL?

                                                  Thanks, Akira

