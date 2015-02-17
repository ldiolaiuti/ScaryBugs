//
//  MasterViewController.m
//  ScaryBugs
//
//  Created by Luca Diolaiuti on 13/02/15.
//  Copyright (c) 2015 Luca Diolaiuti. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ScaryBugData.h"
#import "ScaryBugDoc.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

@synthesize bugs = _bugs;

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    self.title = @"Scary Bugs";
    
    
    //setta i bottoni nella barra in alto
    self.navigationItem.leftBarButtonItem = self.editButtonItem; //bottone modica
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                              target:self
                                              action:@selector(addTapped:)]; //bottone +
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailViewController *detailController = segue.destinationViewController;
    ScaryBugDoc *bug = [self.bugs objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    detailController.detailItem = bug;
}

#pragma mark - Table View


//Comunica all'OS il numero di sezioni nella tabella
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


//Comunica all'OS quante righe ci sono nella sezione
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _bugs.count;
}


//Imposta la cella di un particolare indice
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyBasicCell"];

    ScaryBugDoc *bug = [self.bugs objectAtIndex:indexPath.row];
    cell.textLabel.text = bug.data.title;
    cell.imageView.image = bug.thumbImage;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


//gestisce la modifica di una riga
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [_bugs removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
}


//Implementa il metodo didMoveToParentViewController
//quando la schermata torna da Detail alla tabella, aggiorna la vista (potrebbe essere stato cambiato il nome)
- (void)didMoveToParentViewController:(UIViewController *)parent{
    [self.tableView reloadData];
}


//Crea un insetto con attributi di default e lo aggiunge all'array di insetti
- (void)addTapped:(id)sender {
    ScaryBugDoc *newDoc = [[ScaryBugDoc alloc] initWithTitle:@"New Bug" rating:0 thumbImage:nil fullImage:nil];
    [_bugs addObject:newDoc];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_bugs.count-1 inSection:0];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:YES];
    
    
    //Il codice fa in modo che la tabella si comporti come se venisse selezionato il nuovo elemento
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    [self performSegueWithIdentifier:@"MySegue" sender:self];
}

@end
