WITH target_board AS (
  SELECT id, "createdBy"
  FROM board
  WHERE "publicId" = 'ujsp0ka0ngol' AND "deletedAt" IS NULL
), label_data("publicId", name, "colourCode") AS (
  VALUES
    ('22ep2hwsd44u', 'Retainer', '#0284c7'),
    ('ualhk9eiuorc', 'Project', '#0d9488'),
    ('76cu1asfsz8g', 'Milestone', '#4f46e5'),
    ('6g3g221b3tni', 'Due this week', '#ea580c'),
    ('yl64r0rektt8', 'Overdue', '#dc2626'),
    ('2f0dj2im7iwi', 'Paid', '#65a30d')
)
INSERT INTO label ("publicId", name, "colourCode", "createdBy", "boardId")
SELECT d."publicId", d.name, d."colourCode", b."createdBy", b.id
FROM label_data d
CROSS JOIN target_board b
ON CONFLICT ("publicId") DO NOTHING;
--> statement-breakpoint
WITH target_board AS (
  SELECT id
  FROM board
  WHERE "publicId" = 'ujsp0ka0ngol' AND "deletedAt" IS NULL
), label_data("publicId", name, "colourCode") AS (
  VALUES
    ('22ep2hwsd44u', 'Retainer', '#0284c7'),
    ('ualhk9eiuorc', 'Project', '#0d9488'),
    ('76cu1asfsz8g', 'Milestone', '#4f46e5'),
    ('6g3g221b3tni', 'Due this week', '#ea580c'),
    ('yl64r0rektt8', 'Overdue', '#dc2626'),
    ('2f0dj2im7iwi', 'Paid', '#65a30d')
)
UPDATE label AS l
SET name = d.name, "colourCode" = d."colourCode", "updatedAt" = NOW(), "deletedAt" = NULL
FROM label_data d, target_board b
WHERE l."publicId" = d."publicId" AND l."boardId" = b.id;
--> statement-breakpoint
WITH target_board AS (
  SELECT id, "createdBy"
  FROM board
  WHERE "publicId" = 'ujsp0ka0ngol' AND "deletedAt" IS NULL
), card_data("publicId", list_name, title, description, card_index, card_number, due_date) AS (
  VALUES
    ('97tc13j5f6a7', 'To Invoice', 'Apex Health - kickoff invoice - $85,000', '<p><strong>Invoice:</strong> FF-2609-013</p><p><strong>Amount:</strong> $85,000</p><p><strong>Terms / status:</strong> Net 15</p><p><strong>Next action:</strong> Confirm billing contact and issue the kickoff invoice.</p>', 0, 41, TIMESTAMP '2026-09-08 17:00:00'),
    ('y66ilwx30u2o', 'To Invoice', 'Northstar Labs - September strategy retainer - $28,000', '<p><strong>Invoice:</strong> FF-2609-014</p><p><strong>Amount:</strong> $28,000</p><p><strong>Terms / status:</strong> Net 15</p><p><strong>Next action:</strong> Send with September executive advisory summary.</p>', 1, 57, TIMESTAMP '2026-09-09 17:00:00'),
    ('kwt8add8bmyz', 'To Invoice', 'Apex Health - operating model milestone 2 - $42,500', '<p><strong>Invoice:</strong> FF-2609-015</p><p><strong>Amount:</strong> $42,500</p><p><strong>Terms / status:</strong> Net 30</p><p><strong>Next action:</strong> Confirm milestone acceptance with the COO before issue.</p>', 2, 58, TIMESTAMP '2026-09-11 17:00:00'),
    ('suwpbqp6rdzc', 'To Invoice', 'Atlas Systems - finance analytics workshop - $12,000', '<p><strong>Invoice:</strong> FF-2609-016</p><p><strong>Amount:</strong> $12,000</p><p><strong>Terms / status:</strong> Due on receipt</p><p><strong>Next action:</strong> Attach workshop completion note and attendee list.</p>', 3, 59, TIMESTAMP '2026-09-10 17:00:00'),
    ('ft61k3ko7ot2', 'To Invoice', 'Redwood - approved change-order advisory - $18,500', '<p><strong>Invoice:</strong> FF-2609-017</p><p><strong>Amount:</strong> $18,500</p><p><strong>Terms / status:</strong> Net 15</p><p><strong>Next action:</strong> Match invoice to signed change order CO-04.</p>', 4, 60, TIMESTAMP '2026-09-14 17:00:00'),
    ('8b5r1eq4onkc', 'Invoice Sent', 'Meridian - September transformation retainer - $30,000', '<p><strong>Invoice:</strong> FF-2609-009</p><p><strong>Amount:</strong> $30,000</p><p><strong>Terms / status:</strong> Net 15</p><p><strong>Next action:</strong> Confirm receipt with procurement and track the payment run.</p>', 0, 42, TIMESTAMP '2026-09-12 17:00:00'),
    ('9da5se1zyumt', 'Invoice Sent', 'Beacon Logistics - transformation phase 1 - $47,500', '<p><strong>Invoice:</strong> FF-2609-010</p><p><strong>Amount:</strong> $47,500</p><p><strong>Terms / status:</strong> Net 15</p><p><strong>Next action:</strong> Confirm invoice is queued in the Friday payment run.</p>', 1, 61, TIMESTAMP '2026-09-18 17:00:00'),
    ('gjclq4smofd3', 'Invoice Sent', 'Northstar Labs - RevOps diagnostic - $24,000', '<p><strong>Invoice:</strong> FF-2609-011</p><p><strong>Amount:</strong> $24,000</p><p><strong>Terms / status:</strong> Net 30</p><p><strong>Next action:</strong> Monitor the client procurement portal for approval.</p>', 2, 62, TIMESTAMP '2026-09-21 17:00:00'),
    ('4u4t7qwzain7', 'Invoice Sent', 'Clarity Commerce - leadership workshop - $15,000', '<p><strong>Invoice:</strong> FF-2609-012</p><p><strong>Amount:</strong> $15,000</p><p><strong>Terms / status:</strong> Net 15</p><p><strong>Next action:</strong> Follow up if acknowledgement is not received by Wednesday.</p>', 3, 63, TIMESTAMP '2026-09-16 17:00:00'),
    ('j8bv3rr7hr81', 'Payment Pending', 'Redwood - strategy sprint balance - $22,500', '<p><strong>Invoice:</strong> FF-2608-096</p><p><strong>Amount:</strong> $22,500</p><p><strong>Terms / status:</strong> 5 days overdue</p><p><strong>Next action:</strong> Call the finance lead and secure a settlement date.</p>', 0, 43, TIMESTAMP '2026-09-03 17:00:00'),
    ('u93fhp6uekt6', 'Payment Pending', 'Summit AI - September growth retainer - $36,000', '<p><strong>Invoice:</strong> FF-2608-098</p><p><strong>Amount:</strong> $36,000</p><p><strong>Terms / status:</strong> 7 days overdue</p><p><strong>Next action:</strong> Escalate to VP Finance and request remittance advice.</p>', 1, 64, TIMESTAMP '2026-09-04 17:00:00'),
    ('aki47zji2vs9', 'Payment Pending', 'Harbor Financial - transformation milestone - $52,000', '<p><strong>Invoice:</strong> FF-2608-101</p><p><strong>Amount:</strong> $52,000</p><p><strong>Terms / status:</strong> Net 30</p><p><strong>Next action:</strong> Payment is approved; verify settlement Thursday.</p>', 2, 65, TIMESTAMP '2026-09-10 17:00:00'),
    ('wylvd43h41yo', 'Payment Pending', 'LatticeWorks - final advisory installment - $18,000', '<p><strong>Invoice:</strong> FF-2608-105</p><p><strong>Amount:</strong> $18,000</p><p><strong>Terms / status:</strong> Net 30</p><p><strong>Next action:</strong> Send the closeout pack after funds clear.</p>', 3, 66, TIMESTAMP '2026-09-15 17:00:00'),
    ('r8jhlsdt7bua', 'Paid', 'Northstar Labs - August strategy retainer - $28,000', '<p><strong>Invoice:</strong> FF-2608-084</p><p><strong>Amount:</strong> $28,000</p><p><strong>Terms / status:</strong> Paid 18 Aug</p><p><strong>Next action:</strong> Reconciled to the operating account.</p>', 0, 67, TIMESTAMP '2026-08-18 17:00:00'),
    ('bk4olpzfe6yh', 'Paid', 'Meridian - August transformation retainer - $30,000', '<p><strong>Invoice:</strong> FF-2608-087</p><p><strong>Amount:</strong> $30,000</p><p><strong>Terms / status:</strong> Paid 20 Aug</p><p><strong>Next action:</strong> Reconciled and receipt sent.</p>', 1, 68, TIMESTAMP '2026-08-20 17:00:00'),
    ('gjvkq4c8ax1d', 'Paid', 'Apex Health - discovery deposit - $42,500', '<p><strong>Invoice:</strong> FF-2608-076</p><p><strong>Amount:</strong> $42,500</p><p><strong>Terms / status:</strong> Paid 12 Aug</p><p><strong>Next action:</strong> Applied against the operating model engagement.</p>', 2, 69, TIMESTAMP '2026-08-12 17:00:00'),
    ('i1vq2zr19vrx', 'Paid', 'Beacon Logistics - kickoff deposit - $47,500', '<p><strong>Invoice:</strong> FF-2608-071</p><p><strong>Amount:</strong> $47,500</p><p><strong>Terms / status:</strong> Paid 7 Aug</p><p><strong>Next action:</strong> Deposit reconciled; phase 1 opened.</p>', 3, 70, TIMESTAMP '2026-08-07 17:00:00'),
    ('6uydtbbt534e', 'Paid', 'Summit AI - August growth retainer - $36,000', '<p><strong>Invoice:</strong> FF-2608-069</p><p><strong>Amount:</strong> $36,000</p><p><strong>Terms / status:</strong> Paid 5 Aug</p><p><strong>Next action:</strong> Reconciled to the operating account.</p>', 4, 71, TIMESTAMP '2026-08-05 17:00:00')
)
INSERT INTO card ("publicId", title, description, index, "cardNumber", "createdBy", "listId", "dueDate")
SELECT d."publicId", d.title, d.description, d.card_index, d.card_number, b."createdBy", l.id, d.due_date
FROM card_data d
CROSS JOIN target_board b
JOIN list l ON l."boardId" = b.id AND l.name = d.list_name AND l."deletedAt" IS NULL
ON CONFLICT ("publicId") DO NOTHING;
--> statement-breakpoint
WITH target_board AS (
  SELECT id
  FROM board
  WHERE "publicId" = 'ujsp0ka0ngol' AND "deletedAt" IS NULL
), card_data("publicId", list_name, title, description, card_index, card_number, due_date) AS (
  VALUES
    ('97tc13j5f6a7', 'To Invoice', 'Apex Health - kickoff invoice - $85,000', '<p><strong>Invoice:</strong> FF-2609-013</p><p><strong>Amount:</strong> $85,000</p><p><strong>Terms / status:</strong> Net 15</p><p><strong>Next action:</strong> Confirm billing contact and issue the kickoff invoice.</p>', 0, 41, TIMESTAMP '2026-09-08 17:00:00'),
    ('y66ilwx30u2o', 'To Invoice', 'Northstar Labs - September strategy retainer - $28,000', '<p><strong>Invoice:</strong> FF-2609-014</p><p><strong>Amount:</strong> $28,000</p><p><strong>Terms / status:</strong> Net 15</p><p><strong>Next action:</strong> Send with September executive advisory summary.</p>', 1, 57, TIMESTAMP '2026-09-09 17:00:00'),
    ('kwt8add8bmyz', 'To Invoice', 'Apex Health - operating model milestone 2 - $42,500', '<p><strong>Invoice:</strong> FF-2609-015</p><p><strong>Amount:</strong> $42,500</p><p><strong>Terms / status:</strong> Net 30</p><p><strong>Next action:</strong> Confirm milestone acceptance with the COO before issue.</p>', 2, 58, TIMESTAMP '2026-09-11 17:00:00'),
    ('suwpbqp6rdzc', 'To Invoice', 'Atlas Systems - finance analytics workshop - $12,000', '<p><strong>Invoice:</strong> FF-2609-016</p><p><strong>Amount:</strong> $12,000</p><p><strong>Terms / status:</strong> Due on receipt</p><p><strong>Next action:</strong> Attach workshop completion note and attendee list.</p>', 3, 59, TIMESTAMP '2026-09-10 17:00:00'),
    ('ft61k3ko7ot2', 'To Invoice', 'Redwood - approved change-order advisory - $18,500', '<p><strong>Invoice:</strong> FF-2609-017</p><p><strong>Amount:</strong> $18,500</p><p><strong>Terms / status:</strong> Net 15</p><p><strong>Next action:</strong> Match invoice to signed change order CO-04.</p>', 4, 60, TIMESTAMP '2026-09-14 17:00:00'),
    ('8b5r1eq4onkc', 'Invoice Sent', 'Meridian - September transformation retainer - $30,000', '<p><strong>Invoice:</strong> FF-2609-009</p><p><strong>Amount:</strong> $30,000</p><p><strong>Terms / status:</strong> Net 15</p><p><strong>Next action:</strong> Confirm receipt with procurement and track the payment run.</p>', 0, 42, TIMESTAMP '2026-09-12 17:00:00'),
    ('9da5se1zyumt', 'Invoice Sent', 'Beacon Logistics - transformation phase 1 - $47,500', '<p><strong>Invoice:</strong> FF-2609-010</p><p><strong>Amount:</strong> $47,500</p><p><strong>Terms / status:</strong> Net 15</p><p><strong>Next action:</strong> Confirm invoice is queued in the Friday payment run.</p>', 1, 61, TIMESTAMP '2026-09-18 17:00:00'),
    ('gjclq4smofd3', 'Invoice Sent', 'Northstar Labs - RevOps diagnostic - $24,000', '<p><strong>Invoice:</strong> FF-2609-011</p><p><strong>Amount:</strong> $24,000</p><p><strong>Terms / status:</strong> Net 30</p><p><strong>Next action:</strong> Monitor the client procurement portal for approval.</p>', 2, 62, TIMESTAMP '2026-09-21 17:00:00'),
    ('4u4t7qwzain7', 'Invoice Sent', 'Clarity Commerce - leadership workshop - $15,000', '<p><strong>Invoice:</strong> FF-2609-012</p><p><strong>Amount:</strong> $15,000</p><p><strong>Terms / status:</strong> Net 15</p><p><strong>Next action:</strong> Follow up if acknowledgement is not received by Wednesday.</p>', 3, 63, TIMESTAMP '2026-09-16 17:00:00'),
    ('j8bv3rr7hr81', 'Payment Pending', 'Redwood - strategy sprint balance - $22,500', '<p><strong>Invoice:</strong> FF-2608-096</p><p><strong>Amount:</strong> $22,500</p><p><strong>Terms / status:</strong> 5 days overdue</p><p><strong>Next action:</strong> Call the finance lead and secure a settlement date.</p>', 0, 43, TIMESTAMP '2026-09-03 17:00:00'),
    ('u93fhp6uekt6', 'Payment Pending', 'Summit AI - September growth retainer - $36,000', '<p><strong>Invoice:</strong> FF-2608-098</p><p><strong>Amount:</strong> $36,000</p><p><strong>Terms / status:</strong> 7 days overdue</p><p><strong>Next action:</strong> Escalate to VP Finance and request remittance advice.</p>', 1, 64, TIMESTAMP '2026-09-04 17:00:00'),
    ('aki47zji2vs9', 'Payment Pending', 'Harbor Financial - transformation milestone - $52,000', '<p><strong>Invoice:</strong> FF-2608-101</p><p><strong>Amount:</strong> $52,000</p><p><strong>Terms / status:</strong> Net 30</p><p><strong>Next action:</strong> Payment is approved; verify settlement Thursday.</p>', 2, 65, TIMESTAMP '2026-09-10 17:00:00'),
    ('wylvd43h41yo', 'Payment Pending', 'LatticeWorks - final advisory installment - $18,000', '<p><strong>Invoice:</strong> FF-2608-105</p><p><strong>Amount:</strong> $18,000</p><p><strong>Terms / status:</strong> Net 30</p><p><strong>Next action:</strong> Send the closeout pack after funds clear.</p>', 3, 66, TIMESTAMP '2026-09-15 17:00:00'),
    ('r8jhlsdt7bua', 'Paid', 'Northstar Labs - August strategy retainer - $28,000', '<p><strong>Invoice:</strong> FF-2608-084</p><p><strong>Amount:</strong> $28,000</p><p><strong>Terms / status:</strong> Paid 18 Aug</p><p><strong>Next action:</strong> Reconciled to the operating account.</p>', 0, 67, TIMESTAMP '2026-08-18 17:00:00'),
    ('bk4olpzfe6yh', 'Paid', 'Meridian - August transformation retainer - $30,000', '<p><strong>Invoice:</strong> FF-2608-087</p><p><strong>Amount:</strong> $30,000</p><p><strong>Terms / status:</strong> Paid 20 Aug</p><p><strong>Next action:</strong> Reconciled and receipt sent.</p>', 1, 68, TIMESTAMP '2026-08-20 17:00:00'),
    ('gjvkq4c8ax1d', 'Paid', 'Apex Health - discovery deposit - $42,500', '<p><strong>Invoice:</strong> FF-2608-076</p><p><strong>Amount:</strong> $42,500</p><p><strong>Terms / status:</strong> Paid 12 Aug</p><p><strong>Next action:</strong> Applied against the operating model engagement.</p>', 2, 69, TIMESTAMP '2026-08-12 17:00:00'),
    ('i1vq2zr19vrx', 'Paid', 'Beacon Logistics - kickoff deposit - $47,500', '<p><strong>Invoice:</strong> FF-2608-071</p><p><strong>Amount:</strong> $47,500</p><p><strong>Terms / status:</strong> Paid 7 Aug</p><p><strong>Next action:</strong> Deposit reconciled; phase 1 opened.</p>', 3, 70, TIMESTAMP '2026-08-07 17:00:00'),
    ('6uydtbbt534e', 'Paid', 'Summit AI - August growth retainer - $36,000', '<p><strong>Invoice:</strong> FF-2608-069</p><p><strong>Amount:</strong> $36,000</p><p><strong>Terms / status:</strong> Paid 5 Aug</p><p><strong>Next action:</strong> Reconciled to the operating account.</p>', 4, 71, TIMESTAMP '2026-08-05 17:00:00')
)
UPDATE card AS c
SET title = d.title,
    description = d.description,
    index = d.card_index,
    "cardNumber" = d.card_number,
    "listId" = l.id,
    "dueDate" = d.due_date,
    "updatedAt" = NOW(),
    "deletedAt" = NULL
FROM card_data d
CROSS JOIN target_board b
JOIN list l ON l."boardId" = b.id AND l.name = d.list_name AND l."deletedAt" IS NULL
WHERE c."publicId" = d."publicId"
  AND EXISTS (
    SELECT 1 FROM list current_list
    WHERE current_list.id = c."listId" AND current_list."boardId" = b.id
  );
--> statement-breakpoint
WITH intended_cards("publicId") AS (
  VALUES
    ('97tc13j5f6a7'), ('y66ilwx30u2o'), ('kwt8add8bmyz'), ('suwpbqp6rdzc'),
    ('ft61k3ko7ot2'), ('8b5r1eq4onkc'), ('9da5se1zyumt'), ('gjclq4smofd3'),
    ('4u4t7qwzain7'), ('j8bv3rr7hr81'), ('u93fhp6uekt6'), ('aki47zji2vs9'),
    ('wylvd43h41yo'), ('r8jhlsdt7bua'), ('bk4olpzfe6yh'), ('gjvkq4c8ax1d'),
    ('i1vq2zr19vrx'), ('6uydtbbt534e')
)
DELETE FROM "_card_labels" AS cl
USING card c, list l, board b, intended_cards i
WHERE cl."cardId" = c.id
  AND c."listId" = l.id
  AND l."boardId" = b.id
  AND b."publicId" = 'ujsp0ka0ngol'
  AND c."publicId" = i."publicId";
--> statement-breakpoint
WITH label_map(card_public_id, label_name) AS (
  VALUES
    ('97tc13j5f6a7', 'Due this week'), ('97tc13j5f6a7', 'Project'),
    ('y66ilwx30u2o', 'Due this week'), ('y66ilwx30u2o', 'Retainer'),
    ('kwt8add8bmyz', 'Milestone'), ('kwt8add8bmyz', 'Project'),
    ('suwpbqp6rdzc', 'Due this week'), ('suwpbqp6rdzc', 'Project'),
    ('ft61k3ko7ot2', 'Project'),
    ('8b5r1eq4onkc', 'Retainer'),
    ('9da5se1zyumt', 'Milestone'), ('9da5se1zyumt', 'Project'),
    ('gjclq4smofd3', 'Project'),
    ('4u4t7qwzain7', 'Project'),
    ('j8bv3rr7hr81', 'Overdue'), ('j8bv3rr7hr81', 'Project'),
    ('u93fhp6uekt6', 'Overdue'), ('u93fhp6uekt6', 'Retainer'),
    ('aki47zji2vs9', 'Due this week'), ('aki47zji2vs9', 'Milestone'), ('aki47zji2vs9', 'Project'),
    ('wylvd43h41yo', 'Project'),
    ('r8jhlsdt7bua', 'Paid'), ('r8jhlsdt7bua', 'Retainer'),
    ('bk4olpzfe6yh', 'Paid'), ('bk4olpzfe6yh', 'Retainer'),
    ('gjvkq4c8ax1d', 'Paid'), ('gjvkq4c8ax1d', 'Project'),
    ('i1vq2zr19vrx', 'Paid'), ('i1vq2zr19vrx', 'Project'),
    ('6uydtbbt534e', 'Paid'), ('6uydtbbt534e', 'Retainer')
)
INSERT INTO "_card_labels" ("cardId", "labelId")
SELECT c.id, lb.id
FROM label_map m
JOIN card c ON c."publicId" = m.card_public_id
JOIN list l ON l.id = c."listId"
JOIN board b ON b.id = l."boardId" AND b."publicId" = 'ujsp0ka0ngol'
JOIN label lb ON lb."boardId" = b.id AND lb.name = m.label_name AND lb."deletedAt" IS NULL
ON CONFLICT DO NOTHING;
--> statement-breakpoint
DO $$
DECLARE
  intended_card_count integer;
  intended_label_count integer;
  intended_assignment_count integer;
BEGIN
  SELECT COUNT(DISTINCT c.id), COUNT(DISTINCT lb.id), COUNT(cl.*)
  INTO intended_card_count, intended_label_count, intended_assignment_count
  FROM board b
  LEFT JOIN list l ON l."boardId" = b.id AND l."deletedAt" IS NULL
  LEFT JOIN card c ON c."listId" = l.id
    AND c."deletedAt" IS NULL
    AND c."publicId" IN (
      '97tc13j5f6a7', 'y66ilwx30u2o', 'kwt8add8bmyz', 'suwpbqp6rdzc',
      'ft61k3ko7ot2', '8b5r1eq4onkc', '9da5se1zyumt', 'gjclq4smofd3',
      '4u4t7qwzain7', 'j8bv3rr7hr81', 'u93fhp6uekt6', 'aki47zji2vs9',
      'wylvd43h41yo', 'r8jhlsdt7bua', 'bk4olpzfe6yh', 'gjvkq4c8ax1d',
      'i1vq2zr19vrx', '6uydtbbt534e'
    )
  LEFT JOIN "_card_labels" cl ON cl."cardId" = c.id
  LEFT JOIN label lb ON lb.id = cl."labelId" AND lb."deletedAt" IS NULL
  WHERE b."publicId" = 'ujsp0ka0ngol' AND b."deletedAt" IS NULL;

  IF intended_card_count <> 18 OR intended_label_count <> 6 OR intended_assignment_count <> 32 THEN
    RAISE EXCEPTION 'Founder Finance board sync failed: cards %, labels %, assignments %',
      intended_card_count, intended_label_count, intended_assignment_count;
  END IF;
END $$;
